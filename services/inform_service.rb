class InformService
  attr_reader :bot, :chat_id

  def initialize(bot, chat_id)
    @bot = bot
    @chat_id = chat_id
  end

  def call
    inform_user
  end

  private

  def inform_user
    bot.api.sendMessage(
      chat_id: chat_id,
      text: message_text
    )
  end

  def message_text
    'Debit saved'
  end
end
