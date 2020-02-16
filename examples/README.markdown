# Example Sinatra application

This example illustrated how to configure and work towards Fishbrain identity
services (defaults to staging environment user pool).

## Getting started

Make sure to have installed the dependencies by running `bundler install`.

```sh
CLIENT_ID=... CLIENT_SECRET=... bundle exec ruby examples/app.rb
```

Substituting the ellipses with your credentials.

Visit at [http://localhost:3000](http://localhost:3000).

Note that the example application is configured to run on port `3000` and with a
path prefix `/client/auth` to the authentication paths.

For testing authentication with ID token, make sure to feature the `ID_TOKEN`
environment variable with an ID token when running the command above. An ID
token can be taken from the output after logging in with the OAuth flow.

**Good luck!**
