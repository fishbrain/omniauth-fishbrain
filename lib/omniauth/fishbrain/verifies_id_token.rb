# frozen_string_literal: true

require 'omniauth/fishbrain/jwks'
require 'jwt'

module OmniAuth
  module Fishbrain
    module VerifiesIdToken
      def id_token
        @_id_token ||= if raw_id_token&.strip&.empty?
                         {}
                       else
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
        get_json("#{iss}/.well-known/jwks.json")
      end
    end
  end
end
