# frozen_string_literal: true

require 'json'

module OmniAuth
  module Fishbrain
    module PremiumStatus
      def premium_status
        return {} unless id_token['premium_status']

        JSON.parse(id_token['premium_status'])
      rescue JSON::ParserError
        {}
      end

      def premium?
        Time.xmlschema(premium_status['end_date']) > Time.new.utc
      rescue ArgumentError
        false
      end
    end
  end
end
