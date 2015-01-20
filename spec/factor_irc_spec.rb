require 'spec_helper'

describe 'irc' do
  describe ':: messages' do
    before do
      @scope = service_instance('irc_messages')
    end

    it ':: send' do

      params = {
        'server'  => 'irc.freenode.net',
        'channel' => '#factortest',
        'message' => 'factor test message',
        'user'    => 'fiobot'
      }

      @scope.test_action('send',params) do
        expect_return
      end
    end
  end
end
