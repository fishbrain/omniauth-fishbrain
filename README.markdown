# OmniAuth Fishbrain

![](https://github.com/omniauth/omniauth-github/workflows/Ruby/badge.svg?branch=master)

This gem provides two OmniAuth strategies for Fishbrain.

1. The `fishbrain` strategy is a standard OmniAuth OAuth2 strategy.
2. The `fishbrain_id` strategy is intended for sharing identities between
   services.

## Installation

```ruby
gem 'omniauth-fishbrain'
```

## Usage

In production environments:

```ruby
use OmniAuth::Builder do
  provider :fishbrain, ENV['FISHBRAIN_CLIENT_ID'], ENV['FISHBRAIN_CLIENT_SECRET']
  provider :fishbrain_id
end
```

In development/test/staging environments:

```ruby
use OmniAuth::Builder do
  provider :fishbrain, ENV['FISHBRAIN_CLIENT_ID'], ENV['FISHBRAIN_CLIENT_SECRET'],
                       user_pool_id: 'eu-west-1_WlBhbuD6e',
                       client_options: {
                         site: 'https://accounts-staging.fishbrain.com',
                       }
  provider :fishbrain_id, user_pool_id: 'eu-west-1_WlBhbuD6e'
end
```

`path_prefix` is supported too:

```ruby
use OmniAuth::Builder do
  ...

  configure { |c| c.path_prefix = '/client/auth' }
end
```

See [`/examples`](examples) for full example using Sinatra.

## License

[MIT](LICENSE)
