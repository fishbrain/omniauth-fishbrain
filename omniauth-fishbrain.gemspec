# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'omniauth-fishbrain/version'

Gem::Specification.new do |s|
  s.name     = 'omniauth-fishbrain'
  s.version  = OmniAuth::Fishbrain::VERSION
  s.license  = 'MIT'
  s.summary  = 'OmniAuth strategy for Fishbrain'
  s.authors  = ['Erik Dalen', 'Fishbrain AB']
  s.email    = ['erik.dalen@fishbrain.com', 'developer@fishbrain.com']
  s.homepage = 'https://github.com/fishbrain/omniauth-fishbrain'
  s.files    = Dir['lib/**/*.rb', 'LICENSE', 'README.markdown']
  s.required_ruby_version = '>= 2.5.0'

  s.add_runtime_dependency 'api_cache', '~> 0.3.0'
  s.add_runtime_dependency 'jwt', '~> 2.0'
  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.6'
end
