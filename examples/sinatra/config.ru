require File.expand_path('fishbrain_example', File.dirname(__FILE__))

use OmniAuth::Builder do
  configure do |config|
    config.path_prefix = '/client/auth'
  end
end

run FishbrainExample
