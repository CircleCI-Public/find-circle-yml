# frozen_string_literal: true

module FindCircleYml
  module Bitbucket
    class Service
      attr_reader :user, :password, :team

      def initialize(user, password, team)
        @user = user
        @password = password
        @team = team
      end

      def repositories
        Enumerator.new do |y|
          url = "/repositories/#{team}"
          loop do
            response = request(url)
            parsed_response = JSON.parse(response.body)
            parsed_response.fetch('values', []).each do |value|
              y << Repository.new(
                value.fetch('full_name'),
                value.dig('mainbranch', 'branch') || 'master',
                value.fetch('links').fetch('html').fetch('href')
              )
            end
            break unless parsed_response.key?('next')
            url = parsed_response.fetch('next')
          end
        end
      end

      def configuration_file(repository)
        response = request("/repositories/#{repository.name}/src/#{repository.main_branch}/circle.yml?format=meta")
        return unless response.code == '200'
        parsed_response = JSON.parse(response.body)
        commit = parsed_response.fetch('commit', {}).fetch('hash', repository.main_branch)
        path = parsed_response.fetch('path')
        ConfigurationFile.new("#{repository.url}/src/#{commit}/#{path}")
      end

      private

      def request(path)
        uri = URI("https://api.bitbucket.org/2.0#{path}")
        Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
          request = Net::HTTP::Get.new(uri)
          request.basic_auth(user, password)
          http.request request
        end
      end
    end
  end
end
