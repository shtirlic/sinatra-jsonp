require 'sinatra/contrib'
require 'sinatra/jsonp'

RSpec.configure do |config|
  config.expect_with :rspec
  config.include Sinatra::TestHelpers
end


