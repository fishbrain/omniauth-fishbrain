# OmniAuth Fishbrain

This gem provides two OmniAuth strategies for Fishbrain.

1. The `fishbrain` strategy is a standard Omniauth OAuth2 strategy for signing up and signing in
2. The `fishbrain_id` strategy is intended for sharing a user's identity between services, typically from mobile app to 
   server

## Installation

```ruby
gem 'omniauth-fishbrain'
```

## Usage

In production environments:

```
use OmniAuth::Builder do
  provider :fishbrain, ENV.fetch('FISHBRAIN_CLIENT_ID'), ENV.fetch('FISHBRAIN_CLIENT_SECRET')
  provider :fishbrain_id
end
```

In development/test/staging environments:

```
use OmniAuth::Builder do
  provider :fishbrain, ENV.fetch('FISHBRAIN_CLIENT_ID'), ENV.fetch('FISHBRAIN_CLIENT_SECRET'), 
                       user_pool_id: 'eu-west-1_K2uP41DlP',
                       client_options: {
                         site: 'https://accounts-staging.fishbrain.com',
                       }
  provider :fishbrain_id, user_pool_id: 'eu-west-1_K2uP41DlP'
end
```

`path_prefix` is supported too:

```
use OmniAuth::Builder do
  ...

  configure { |c| c.path_prefix = '/client/auth' }
end
```


See [`/examples`](examples) for full example using Sinatra.

## LICENSE

[MIT](LICENSE)
