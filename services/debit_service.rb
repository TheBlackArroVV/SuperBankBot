class DebitService
  attr_reader :count, :currency

  def initialize(count, currency)
    @count = count
    @currency = currency
  end

  def call
    ::DebitEntity.new({ count: count, currency: currency }).save
  end
end
