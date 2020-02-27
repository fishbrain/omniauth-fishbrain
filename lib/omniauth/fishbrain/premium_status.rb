# frozen_string_literal: true

require 'date'
require 'json'

module OmniAuth
  module Fishbrain
    module PremiumStatus
      def premium_status
        return {} unless id_token['premium_status']

        JSON.parse id_token['premium_status']
      rescue JSON::ParserError
        {}
      end

      def premium?
        DateTime.rfc3339(premium_status['premium_end_date']) > DateTime.now
      rescue ArgumentError
        # if format was wrong
        false
      end
    end
  end
end
