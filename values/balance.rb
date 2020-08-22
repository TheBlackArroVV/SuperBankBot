require_relative '../db/database'
require_relative '../presenters/balance_presenter'

class Balance
  attr_reader :chat_id, :bot, :user_id

  def initialize(message, bot)
    @chat_id = message.chat.id
    @bot = bot
    @user_id = message.from.id
  end

  def call
    InformService.new(bot, chat_id, text).call
  end

  private

  def text
    result = count(:debit).merge(count(:credit)) { |_key, v1, v2| v1.to_f - v2.to_f }
    BalancePresenter.new(result).call
  end

  def count(type)
    entities = Database.new.instance_variable_get(:@db)["#{type}_entities".to_sym].where(telegram_id: user_id)
    entities = entities.all.group_by { |e| e[:currency] }
    entities.map do |key, value|
      sum = value.inject(0) { |s, hash| s + hash[:count] }
      { key => sum }
    end.inject({}, :merge)
  end
end
