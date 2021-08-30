# frozen_string_literal: true

require 'net/http'
require 'api_cache'

module OmniAuth
  module Fishbrain
    module Jwks
      def get_json(uri)
        APICache.get('fishbrain_jwks', cache: 86_400) do # 24 hours
          uri
            .yield_self(&URI.method(:parse))
            .yield_self(&Net::HTTP.method(:get))
            .yield_self { |it| JSON.parse(it, symbolize_names: true) }
        end
      end
    end
  end
end
