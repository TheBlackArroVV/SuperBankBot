class BalancePresenter
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def call
    data.map do |key, value|
      "#{value.to_f} #{key}"
    end.join("\n").to_s
  end
end
