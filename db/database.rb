require 'sequel'

class Database
  def initialize
    @db = Sequel.connect(DATABASE_URL)
  end
end
