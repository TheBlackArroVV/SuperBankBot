Sequel.migration do
  change do
    create_table? :debit_entities do
      primary_key :id
      String :currency
      Decimal :count
    end
  end
end
