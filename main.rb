require 'telegram/bot'
require_relative 'db/database'
require 'dotenv/load'
require 'pry'
require_relative 'entities/entity'

Dir[File.join(__dir__, 'config', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'services', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'entities', '*.rb')].each { |file| require file }

DB = Database.new

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    ProcessService.new(message).call
    InformService.new(bot, message.chat.id).call
  end
end
