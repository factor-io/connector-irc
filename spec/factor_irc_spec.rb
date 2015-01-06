require 'spec_helper'

describe 'IRC' do
  describe 'Messages' do
    it 'can send a message' do
      test_instance = service_instance('irc')

      params = {
        'server'  => 'irc.freenode.net',
        'channel' => '#factortest',
        'message' => 'factor test message',
        'user'    => 'fiobot'
      }

      test_instance.test_action('send',params) do
        expect_info message: "IRC: Connecting to #{params['server']}..."
        expect_info message: "IRC: Logging in as #{params['user']}"
        expect_info message: "IRC: Joining channel #{params['channel']}"
        expect_info message: "IRC: Successfully joined #{params['channel']}"
        expect_info message: "IRC: Sending message: #{params['message']}"
        expect_info message: 'IRC: Message sent, exiting'

        response = expect_return
        expect(response[:payload]).to be_a(Hash)
        expect(response[:payload]['message']).to be_a(String)
        expect(response[:payload]['message']).to eq params['message']
      end
    end
  end
end
