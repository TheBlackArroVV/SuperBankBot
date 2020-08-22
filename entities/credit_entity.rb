class CreditEntity < Entity
  def save
    @credit_entities.insert(@params)
  end

  private

  def table_name
    :credit_entities
  end
end
