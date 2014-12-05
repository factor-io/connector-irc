require 'factor-connector-api'
require 'cinch'

Factor::Connector.service 'irc' do
  action 'send' do |params|
    irc_server    = params['server']
    irc_channel   = params['channel']
    irc_password  = params['password']
    irc_message   = params['message']
    irc_user      = params['user']

    irc_channel   += " #{irc_password}" if irc_password

    fail "IRC: Parameter 'server' is required" unless irc_server
    fail "IRC: Parameter 'channel' is required" unless irc_channel
    fail "IRC: Parameter 'message' is required" unless irc_message
    fail "IRC: parameter 'user' is required" unless irc_user

    irc_bot = Cinch::Bot.new do
      configure do |config|
        config.server   = irc_server
        config.channels = [irc_channel]
        config.user     = irc_user
        config.nick     = irc_user
      end
      on :connect do
        info "Sending #{irc_message} to channel #{irc_channel}"
        Channel(irc_channel).send(irc_message)
        irc_bot.quit(irc_message)
      end
    end

    irc_bot.start
    action_callback params
  end
end
