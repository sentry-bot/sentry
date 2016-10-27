require 'sentry/version'
require 'cinch'
require 'cinch/plugins/sentry/titles'
require 'cinch/plugins/sentry/github'
require 'cinch/plugins/sentry/reddit'
require 'cinch/plugins/sentry/videos'
require "cinch/plugins/identify"

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
          Cinch::Plugins::Sentry::Videos,
          Cinch::Plugins::Identify]
        c.plugins.options = {}

        if config["plugins"]["identify"]["enabled"] then
          c.plugins.options[Cinch::Plugins::Identify] = {
            :password => config["plugins"]["identify"]["password"],
            :type => :nickserv
          }
        end
        if config["plugins"]["reddit"]["enabled"] then
          c.plugins.options[Cinch::Plugins::Sentry::Reddit] = {
            "username" => config["plugins"]["reddit"]["username"],
            "password" => config["plugins"]["reddit"]["password"]
          }
        end
        if config["plugins"]["youtube"]["enabled"] then
          c.plugins.options[Cinch::Plugins::Sentry::Videos] = {
            "youtube" => config["plugins"]["youtube"]["apikey"]
          }
        end
        if config["plugins"]["vimeo"]["enabled"] then
          c.plugins.options[Cinch::Plugins::Sentry::Videos] = {
            "vimeo" => config["plugins"]["vimeo"]["apikey"]
          }
        end

      end
    end

    return bot
  end
end
