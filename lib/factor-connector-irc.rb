require 'irconnect'
require 'factor/connector/definition'

class IrcConnectorDefinition < Factor::Connector::Definition
  id :irc

  def validate(params, key, name)
    value = params[key]
    fail "#{name} (:#{key}) is required" unless value
    value
  end

  def setup_bot(params)
    server  = validate(params,:server,'Server')
    channel = validate(params,:channel,'Channel')
    message = validate(params,:message,'Message')
    user    = validate(params,:user,'User')
    nick    = params[:nick] || user
    bot     = nil
    begin
      info "Connecting to '#{server}'..."
      bot = IRConnect::Connection.new(server)
      info "Logging in as '#{nick}'"
      bot.login(nick, 'hostname', 'servername', nick)
    rescue
      fail "Failed to connect to server '#{server}'"
    end
    bot
  end

  resource :message do
    action :send do |params|
      channel = validate(params,:channel,'Channel')
      message = validate(params,:message,'Message')
      bot = setup_bot(params)
      begin
        info "Joining channel #{channel}"
        bot.join_channel(channel)
        info "Successfully joined #{channel}"
        info "Sending message: #{message}"
        bot.privmsg(channel, message)
        info 'Message sent, exiting'
      rescue
        fail "Failed to execute command"
      end

      respond status:'sent'
    end
  end
end
