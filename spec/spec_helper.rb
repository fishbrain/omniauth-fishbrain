# frozen_string_literal: true

require 'omniauth'
require 'omniauth-fishbrain'
require 'rack/test'
require 'rspec'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.extend OmniAuth::Test::StrategyMacros, type: :strategy
end
