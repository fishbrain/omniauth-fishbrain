# OmniAuth Fishbrain

OmniAuth strategy for Fishbrain

## Installation

```ruby
gem 'omniauth-fishbrain'
```

## Usage

```
use OmniAuth::Builder do
  provider :fishbrain, ENV.fetch('FISHBRAIN_CLIENT_ID'), ENV.fetch('FISHBRAIN_CLIENT_SECRET')
end
```

See [`/examples`](examples) for full example using Sinatra.

## LICENSE

[MIT](LICENSE)
