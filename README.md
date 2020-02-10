# omniauth-fishbrain

OmniAuth strategy for authenticating with Fishbrain

## Installation

Add to your `Gemfile`:

```ruby
gem 'omniauth-google-oauth2'
```

Then `bundle install`.

## Usage

Add something like the following to add the fishbrain authentication stategy.

```
  use OmniAuth::Builder do
    provider :fishbrain, ENV.fetch('FISHBRAIN_CLIENT_ID'), ENV.fetch('FISHBRAIN_CLIENT_SECRET')
  end
```

See `/examples` for a full example using Sinatra & Omniauth.
