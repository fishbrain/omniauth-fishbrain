# frozen_string_literal: true

require 'omniauth-oauth2'
require 'omniauth/fishbrain/verifies_id_token'
require 'omniauth/fishbrain/premium_status'

module OmniAuth
  module Strategies
    class Fishbrain < OmniAuth::Strategies::OAuth2
      include OmniAuth::Fishbrain::VerifiesIdToken
      include OmniAuth::Fishbrain::PremiumStatus

      option :name, 'fishbrain'
      option :client_options, site: 'https://accounts.fishbrain.com',
                              authorize_url: '/oauth2/authorize',
                              token_url: '/oauth2/token',
                              auth_scheme: :basic_auth
      option :scope, 'email openid profile'
      option :user_pool_id, 'eu-west-1_5r0WbR8OH'
      option :aws_region, 'eu-west-1'
      option :jwt_leeway, 60

      uid do
        id_token['sub']
      end

      info do
        {
          given_name: id_token['given_name'],
          email: id_token['email'],
          phone: id_token['phone_number'],
        }
      end

      credentials do
        hash = { token: access_token.token }
        if access_token.expires?
          hash[:refresh_token] = access_token.refresh_token if access_token.refresh_token
          hash[:expires_at] = access_token.expires_at
        end
        hash[:expires] = access_token.expires?
        hash[:id_token] = access_token['id_token'] if access_token['id_token']
        hash
      end

      extra do
        {
          raw_info: id_token.reject { |key| %w[iss aud exp iat token_use].include?(key) },
          premium_status: premium_status,
          is_premium: premium?,
        }
      end

      private

      def callback_url
        full_host + script_name + callback_path
      end

      def raw_id_token
        access_token['id_token']
      end
    end
  end
end
