class ProcessService
  attr_reader :message, :chat_id

  def initialize(message)
    @message = message.text
    @chat_id = message.chat.id
  end

  def call
    operation_service.new(count, currency, chat_id).call
  end

  private

  def message_arguments
    message.split(' ')
  end

  def operation_service
    message_arguments.first == '+' ? DebitService : nil
  end

  def count
    message_arguments[1]
  end

  def currency
    message_arguments.last
  end
end
