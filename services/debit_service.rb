class DebitService
  attr_reader :count, :currency, :user_id

  def initialize(count, currency, user_id)
    @count = count
    @currency = currency
    @user_id = user_id
  end

  def call
    ::DebitEntity.new({ count: count, currency: currency, telegram_id: user_id }).save
  end
end
