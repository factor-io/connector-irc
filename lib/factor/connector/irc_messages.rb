require 'factor-connector-api'
require 'irconnect'

Factor::Connector.service 'irc_messages' do
  action 'send' do |params|
    server    = params['server']
    channel   = params['channel']
    message   = params['message']
    user      = params['user']
    nick      = params['nick'] || user

    fail "Server ('server') is required" unless server
    fail "Channel ('channel') is required" unless channel
    fail "Messages ('message') is required" unless message
    fail "User ('user') is required" unless user

    begin
      info "Connecting to #{server}..."
      bot = IRConnect::Connection.new(server)
      info "Logging in as #{nick}"
      bot.login(nick, 'hostname', 'servername', nick)
      info "Joining channel #{channel}"
      bot.join_channel(channel)
      info "Successfully joined #{channel}"
      info "Sending message: #{message}"
      bot.privmsg(channel, message)
      info 'Message sent, exiting'
    rescue
      fail "Failed to execute command"
    end

    action_callback
  end
end
