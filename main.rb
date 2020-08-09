require 'telegram/bot'
require_relative 'db/database'
require 'dotenv/load'
require 'pry'

DB = Database.new

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
  end
end
