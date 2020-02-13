# Sinatra example

This example uses a path_prefix in a rackup configuration and illustrates how to configure a development example to work
towards Fishbrain's Cognito staging environment.

Start by installing the gems:

`$ cd examples/sinatra && bundle`

Then run the application with rackup:

`$ FISHBRAIN_CLIENT_ID=<staging_client_id> FISHBRAIN_CLIENT_SECRET=<staging_client_secret> bundle exec rackup -p 3000`

And run without rackup:

`$ FISHBRAIN_CLIENT_ID=<staging_client_id> FISHBRAIN_CLIENT_SECRET=<staging_client_secret> PORT=3000 ruby fishbrain_example.rb`
