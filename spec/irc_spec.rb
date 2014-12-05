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

      test_instance.test_action('send',params) do
        response = expect_return
        expect(response[:payload]).to be_a(Hash)
        expect(response[:payload]).to include('factor test message')
        expect(response[:payload]['message']).to be_a(String)
        expect(response[:payload]['message']).to eq 'factor test message'
      end
    end
  end
end
