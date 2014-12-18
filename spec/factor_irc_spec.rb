require 'spec_helper'

describe 'IRC' do
  describe 'Messages' do
    it 'can send a message' do
      test_instance = service_instance('irc')

      params = {
        'server'  => 'irc.freenode.net',
        'channel' => '#factortest',
        'message' => 'factor test message',
        'user'    => 'factor-test-bot'
      }

      test_instance.test_action('send', params) do
        expect_info message: 'IRC: Connecting to irc.freenode.net...'
        expect_info message: 'IRC: Logging in as factor-test-bot'
        expect_info message: 'IRC: Joining channel #factortest'
        expect_info message: 'IRC: Successfully joined #factortest'
        expect_info message: 'IRC: Sending message: factor test message'
        expect_info message: 'IRC: Message sent, exiting'
        response = expect_return
        expect(response[:payload]).to be_a(Hash)
        expect(response[:payload]['message']).to be_a(String)
        expect(response[:payload]['message']).to eq 'factor test message'
      end
    end
  end
end
