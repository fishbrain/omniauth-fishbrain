# frozen_string_literal: true

require 'omniauth'
require 'omniauth-fishbrain'
require 'sinatra'

USER_POOL_ID = ENV.fetch('USER_POOL_ID', 'eu-west-1_9AdkO5S3c')
CLIENT_ID = ENV.fetch('CLIENT_ID')
CLIENT_SECRET = ENV.fetch('CLIENT_SECRET')
ID_TOKEN = ENV.fetch('ID_TOKEN', nil)
SITE = 'https://accounts.staging.fishbrain.com'

set :port, 3000
set :sessions, true

use OmniAuth::Builder do
  provider :fishbrain_id, user_pool_id: USER_POOL_ID
  provider :fishbrain, CLIENT_ID, CLIENT_SECRET, user_pool_id: USER_POOL_ID,
                                                 client_options: {
                                                   site: SITE,
                                                 }

  configure { |c| c.path_prefix = '/client/auth' }
end

get '/' do
  haml :index
end

get '/logout' do
  session.delete('current_user')
  redirect "#{SITE}/logout?client_id=#{CLIENT_ID}&logout_uri=http://localhost:3000/"
end

get '/client/auth/failure' do
  haml :failure
end

get '/client/auth/:provider/callback' do
  auth = request.env['omniauth.auth']
  session['current_user'] = { given_name: auth.info.given_name, uid: auth.uid }
  haml :callback
end

__END__
@@ index
- if session['current_user']
  %a{href: '/logout'}
    Log out
  %pre= session['current_user'].pretty_inspect
- else
  - if ID_TOKEN
    %a{href: "/client/auth/fishbrain_id?id_token=#{ID_TOKEN}"}
      Identify with Fishbrain
    %br
  %a{href: '/client/auth/fishbrain'}
    Log in with Fishbrain

@@ callback
%a{href: '/'} Go to Root
%pre= request.env['omniauth.auth'].pretty_inspect

@@ failure
%a{href: '/'} Go to Root
%pre= params['message']
