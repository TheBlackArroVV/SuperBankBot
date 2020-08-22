class InformService
  attr_reader :bot, :chat_id, :text

  def initialize(bot, chat_id, text)
    @bot = bot
    @chat_id = chat_id
    @text = text
  end

  def call
    inform_user
  end

  private

  def inform_user
    bot.api.sendMessage(
      chat_id: chat_id,
      text: text.empty? ? 'fail' : text
    )
  end
end
