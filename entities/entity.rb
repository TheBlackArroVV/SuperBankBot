require_relative '../db/database'

class Entity < Database
  def initialize(params)
    super()
    @params = params
    instance_variable_set("@#{table_name}", @db[table_name])
  end
end
