# frozen_string_literal: true

require File.expand_path(
  File.join('..', 'lib', 'omniauth', 'fishbrain', 'version'),
  __FILE__
)

Gem::Specification.new do |gem|
  gem.name          = 'omniauth-fishbrain'
  gem.version       = OmniAuth::Fishbrain::VERSION
  gem.license       = 'MIT'
  gem.summary       = %(A Fishbrain strategy for OmniAuth 1.x)
  gem.description   = %(A Fishbrain strategy for OmniAuth 1.x. This allows you to login to Fishbrain with your ruby app.)
  gem.authors       = ['Erik Dalen']
  gem.email         = ['erik.dalen@fishbrain.com']
  gem.homepage      = 'https://github.com/fishbrain/omniauth-fishbrain'

  gem.files         = `git ls-files`.split("\n")
  gem.require_paths = ['lib']

  gem.required_ruby_version = '>= 2.2'

  gem.add_runtime_dependency 'jwt', '~> 2.0'
  gem.add_runtime_dependency 'omniauth-oauth2', '~> 1.6'
end
