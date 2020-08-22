class DebitService
  attr_reader :count, :currency, :chat_id

  def initialize(count, currency, chat_id)
    @count = count
    @currency = currency
    @chat_id = chat_id
  end

  def call
    ::DebitEntity.new({count: count, currency: currency}).save
  end
end
