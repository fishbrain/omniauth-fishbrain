# frozen_string_literal: true

require 'net/http'
require 'jwt'

module OmniAuth
  module Fishbrain
    module VerifiesIdToken
      def id_token
        @_id_token ||= begin
          return {} unless raw_id_token

          JWT.decode(raw_id_token, nil, true, decode_options).first
        end
      end

      def decode_options
        {
          iss: iss,
          aud: options[:client_id],
          verify_aud: true,
          verify_expiration: true,
          verify_iat: true,
          verify_iss: true,
          verify_not_before: true,
          leeway: options[:jwt_leeway],
          algorithm: 'RS256',
          jwks: jwks,
        }
      end

      def iss
        "https://cognito-idp.#{options[:aws_region]}.amazonaws.com/#{options[:user_pool_id]}"
      end

      def jwks
        @_jwks ||= \
          "#{iss}/.well-known/jwks.json"
            .yield_self(&URI.method(:parse))
            .yield_self(&Net::HTTP.method(:get))
            .yield_self { |it| JSON.parse(it, symbolize_names: true) }
      end
    end
  end
end
