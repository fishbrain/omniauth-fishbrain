#!/usr/bin/env ruby
# frozen_string_literal: true

require 'sinatra/base'
require 'omniauth'
require 'omniauth-fishbrain'
require 'pp'

# Example Sinatra+Omniauth+Fishbrain app
class FishbrainExample < Sinatra::Application
  configure do
    set :sessions, true
    set :haml, format: :html5
  end
  use OmniAuth::Builder do
    provider :fishbrain,
             ENV.fetch('FISHBRAIN_CLIENT_ID'),
             ENV.fetch('FISHBRAIN_CLIENT_SECRET'),
             client_options: {
               site: 'https://accounts-staging.fishbrain.com'
             }
    configure do |config|
      config.path_prefix = '/client/auth'
    end
  end

  get '/' do
    haml :index
  end

  get '/client/auth/failure' do
    haml :auth_failure
  end

  get '/client/auth/:provider/callback' do
    haml :callback
  end

  run! if app_file == $PROGRAM_NAME
end
