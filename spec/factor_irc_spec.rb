require 'spec_helper'

describe IrcConnectorDefinition do
  describe :message do
    before do
      Factor::Connector::Test.timeout = 20
      @runtime = Factor::Connector::Runtime.new(IrcConnectorDefinition)
    end

    after do
      Factor::Connector::Test.reset
    end

    it :send do
      params = {
        server:  'irc.freenode.net',
        channel: '#factortest',
        message: 'factor test message',
        user:    'fiobot'
      }
      @runtime.run([:message,:send],params)

      expect(@runtime).to respond
      data = @runtime.logs.last[:data]
      expect(data[:status]).to eq('sent')
    end
  end
end
