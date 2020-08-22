class DebitEntity < Entity
  def save
    @debit_entities.insert(@params)
  end

  private

  def table_name
    :debit_entities
  end
end
