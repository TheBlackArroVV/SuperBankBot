class ProcessService
  attr_reader :message, :bot, :chat_id, :user_id

  def initialize(message, bot)
    @message = message.text
    @chat_id = message.chat.id
    @bot = bot
    @user_id = message.from.id
  end

  def call
    operation_service.new(count, currency, user_id).call
    InformService.new(bot, chat_id, text).call
  end

  private

  def message_arguments
    message.split(' ')
  end

  def operation_service
    message_arguments.first == '+' ? DebitService : CreditService
  end

  def count
    message_arguments[1]
  end

  def currency
    message_arguments.last
  end

  def text
    message_arguments.first == '+' ? 'Debit saved' : 'Credit saved'
  end
end
