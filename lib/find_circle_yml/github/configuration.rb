# frozen_string_literal: true

module FindCircleYml
  module GitHub
    class Configuration
      ENVIRONMENT_VARIABLES = %w[
        GITHUB_USER
        GITHUB_ACCESS_TOKEN
        GITHUB_ORGANIZATION
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
        GitHub::Service.new(
          environment.fetch('GITHUB_USER'),
          environment.fetch('GITHUB_ACCESS_TOKEN'),
          environment.fetch('GITHUB_ORGANIZATION')
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
