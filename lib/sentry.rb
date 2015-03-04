require 'sentry/version'
require 'cinch'
require 'cinch/plugins/sentry/titles'
require 'cinch/plugins/sentry/github'
require 'cinch/plugins/sentry/reddit'
require 'cinch/plugins/sentry/videos'

module Sentry
  module_function

  def new
    # Configure the bot
    bot = Cinch::Bot.new do
      configure do |c|
        c.server = "irc.oftc.net"
        c.port = 6697
        c.ssl.use = true
        c.ssl.verify = false
        c.nick = "sentry"
        c.user = "sentry"
        c.realname = "sentry"
        c.channels = ["#chan"]
        c.plugins.prefix = "!"
        c.plugins.plugins = [
          Cinch::Plugins::Sentry::Titles,
          Cinch::Plugins::Sentry::GitHub,
          Cinch::Plugins::Sentry::Reddit,
          Cinch::Plugins::Sentry::Videos]
        c.plugins.options = {
          Cinch::Plugins::Sentry::Reddit => {
            "username" => "user",
            "password" => "pass"
          }
        }
      end
    end

    return bot
  end
end