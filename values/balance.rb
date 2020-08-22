require_relative '../db/database'
require_relative '../presenters/balance_presenter'

class Balance
  attr_reader :chat_id, :bot

  def initialize(chat_id, bot)
    @chat_id = chat_id
    @bot = bot
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
    entities = Database.new.instance_variable_get(:@db)["#{type}_entities".to_sym]
    entities = entities.all.group_by { |e| e[:currency] }
    entities.map do |key, value|
      sum = value.inject(0) { |s, hash| s + hash[:count] }
      { key => sum }
    end.inject({}, :merge)
  end
end
