require 'sentry/version'
require 'cinch'
require 'cinch/plugins/sentry/titles'
require 'cinch/plugins/sentry/github'
require 'cinch/plugins/sentry/reddit'
require 'cinch/plugins/sentry/videos'

module Sentry
  module_function

  def new (config)
    # Configure the bot
    bot = Cinch::Bot.new do
      configure do |c|
        c.server = config["irc"]["host"]
        c.port = config["irc"]["port"]
        c.ssl.use = config["irc"]["ssl"]
        c.ssl.verify = config["security"]["ssl"]["verify"]
        c.nick = config["bot"]["nick"]
        c.user = config["bot"]["user"]
        c.realname = config["bot"]["name"]
        c.channels = config["channels"]
        c.plugins.prefix = "!"
        c.plugins.plugins = [
          Cinch::Plugins::Sentry::Titles,
          Cinch::Plugins::Sentry::GitHub,
          Cinch::Plugins::Sentry::Reddit,
          Cinch::Plugins::Sentry::Videos]
        c.plugins.options = {
          Cinch::Plugins::Sentry::Reddit => {
            "username" => config["plugins"]["reddit"]["username"],
            "password" => config["plugins"]["reddit"]["password"]
          }
        }
      end
    end

    return bot
  end
end
