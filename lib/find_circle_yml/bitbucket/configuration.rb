# frozen_string_literal: true

module FindCircleYml
  module Bitbucket
    class Configuration
      ENVIRONMENT_VARIABLES = %w[
        BITBUCKET_USER
        BITBUCKET_APP_PASSWORD
        BITBUCKET_TEAM
      ].freeze

      attr_reader :environment

      def initialize(environment)
        @environment = environment
      end

      def provided?
        ENVIRONMENT_VARIABLES.any? do |environment_variable|
          environment.key?(environment_variable)
        end
      end

      def valid?
        missing.empty?
      end

      def error_message
        "Set environment variables: #{missing.join(', ')}"
      end

      def service
        Bitbucket::Service.new(
          environment.fetch('BITBUCKET_USER'),
          environment.fetch('BITBUCKET_APP_PASSWORD'),
          environment.fetch('BITBUCKET_TEAM')
        )
      end

      private

      def missing
        ENVIRONMENT_VARIABLES.reject do |environment_variable|
          environment.key?(environment_variable)
        end
      end
    end
  end
end
