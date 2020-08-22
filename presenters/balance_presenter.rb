class BalancePresenter
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def call
    data.map do |key, value|
      "#{value} #{key}"
    end.join("\n").to_s
  end
end
