Sequel.migration do
  change do
    add_column :debit_entities, :telegram_id, Integer
    add_column :credit_entities, :telegram_id, Integer
  end
end
