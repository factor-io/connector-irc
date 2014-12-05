require 'rspec'
require 'factor-connector-api/test'

Dir.glob('../lib/factor/connector/*.rb').each { |f| require f }

RSpec.configure do |c|
  c.include Factor::Connector::Test
end
