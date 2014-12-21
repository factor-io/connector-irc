require 'factor-connector-api'
require './lib/irc_connector.rb'

Factor::Connector.service 'irc' do
  action 'send' do |params|
    irc_server    = params['server']
    irc_channel   = params['channel']
    irc_message   = params['message']
    irc_user      = params['user']
    irc_nick      = params['nick'].nil? ? irc_user : params['nick']

    fail "IRC: Parameter 'server' is required" unless irc_server
    fail "IRC: Parameter 'channel' is required" unless irc_channel
    fail "IRC: Parameter 'message' is required" unless irc_message
    fail "IRC: parameter 'user' is required" unless irc_user

    begin
        info "IRC: Connecting to #{irc_server}..."
        irc_bot = IRCConnector.new(irc_server)
        info "IRC: Logging in as #{irc_nick}"
        irc_bot.login(irc_nick, 'hostname', 'servername', irc_nick)
        info "IRC: Joining channel #{irc_channel}"
        irc_bot.join_channel(irc_channel)
        info "IRC: Successfully joined #{irc_channel}"
        info "IRC: Sending message: #{irc_message}"
        irc_bot.privmsg(irc_channel, irc_message)
        info 'IRC: Message sent, exiting'
    rescue
        fail "IRC: Failed"
    end

    action_callback params
  end
end
