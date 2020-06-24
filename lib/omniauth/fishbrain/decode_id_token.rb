# frozen_string_literal: true

require 'net/http'
require 'jwt'

module OmniAuth
  module Fishbrain
    class DecodeIdToken
      AWS_REGION = 'eu-west-1'
      USER_POOL_ID = 'eu-west-1_TKWveIcYu'

      attr_reader :client_id, :aws_region, :user_pool_id, :jwt_leeway

      def initialize(client_id, user_pool_id = USER_POOL_ID, aws_region = AWS_REGION)
        @client_id = client_id
        @user_pool_id = user_pool_id
        @aws_region = aws_region
        @jwt_leeway = 60
      end

      def decode(raw_id_token)
        JWT.decode(raw_id_token, nil, true, decode_options).first
      end

      private

      def decode_options
        {
          iss: iss,
          aud: client_id,
          verify_aud: true,
          verify_expiration: true,
          verify_iat: true,
          verify_iss: true,
          verify_not_before: true,
          leeway: jwt_leeway,
          algorithm: 'RS256',
          jwks: jwks,
        }
      end

      def iss
        "https://cognito-idp.#{aws_region}.amazonaws.com/#{user_pool_id}"
      end

      def jwks
        @_jwks ||= "#{iss}/.well-known/jwks.json"
          .yield_self(&URI.method(:parse))
          .yield_self(&Net::HTTP.method(:get))
          .yield_self { |it| JSON.parse(it, symbolize_names: true) }
      end
    end
  end
end
