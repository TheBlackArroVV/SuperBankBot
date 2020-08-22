require 'telegram/bot'
require_relative 'db/database'
require 'dotenv/load'
require 'pry'
require_relative 'entities/entity'

Dir[File.join(__dir__, 'config', '*.rb')].sort.each { |file| require file }
Dir[File.join(__dir__, 'values', '*.rb')].sort.each { |file| require file }
Dir[File.join(__dir__, 'services', '*.rb')].sort.each { |file| require file }
Dir[File.join(__dir__, 'entities', '*.rb')].sort.each { |file| require file }

DB = Database.new

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when 'balance'
      Balance.new(message.chat.id, bot).call
    else
      ProcessService.new(message, bot).call
    end
  end
end
