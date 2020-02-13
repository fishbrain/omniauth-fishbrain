# Sinatra example

This example uses a path_prefix in a rackup configuration and illustrates how to configure a development example to work
towards Fishbrain's Cognito staging environment.

Start by installing the gems:

`$ cd examples/sinatra && bundle`

Then run the application with rackup:

`$ FISHBRAIN_CLIENT_ID=<staging_client_id> FISHBRAIN_CLIENT_SECRET=<staging_client_secret> bundle exec rackup -p 3000`

Alternatively, configure the app with this block:

`use OmniAuth::Builder do
     provider :fishbrain,
              ENV.fetch('FISHBRAIN_CLIENT_ID'),
              ENV.fetch('FISHBRAIN_CLIENT_SECRET'),
              path_prefix: '/client/auth',
              client_options: {
                site: 'https://accounts-staging.fishbrain.com'
              }
   end` 
   
And run without rackup:

`$ FISHBRAIN_CLIENT_ID=<staging_client_id> FISHBRAIN_CLIENT_SECRET=<staging_client_secret> PORT=3000 ruby fishbrain_example.rb`
