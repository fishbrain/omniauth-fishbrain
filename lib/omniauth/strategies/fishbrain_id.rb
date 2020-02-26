# frozen_string_literal:true

require 'omniauth/fishbrain/verifies_id_token'
require 'omniauth/fishbrain/premium_status'

module OmniAuth
  module Strategies
    class FishbrainId
      include OmniAuth::Strategy
      include OmniAuth::Fishbrain::VerifiesIdToken
      include OmniAuth::Fishbrain::PremiumStatus

      option :name, 'fishbrain_id'
      option :user_pool_id, 'eu-west-1_5r0WbR8OH'
      option :client_id, nil
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

      extra do
        {
          raw_info: id_token.reject { |key| %w[iss aud exp iat token_use].include?(key) },
          premium_status: premium_status,
          is_premium: premium?,
        }
      end

      def callback_phase
        if raw_id_token
          id_token
          super
        else
          fail! :missing_id_token
        end
      rescue JWT::ExpiredSignature
        fail! :invalid_id_token
      end

      def request_phase
        redirect callback_url
      end

      private

      def raw_id_token
        request.params['id_token']
      end
    end
  end
end
