Dir[File.join(__dir__, 'config', '*.rb')].each { |file| require file }

namespace :db do
  desc 'Run migrations'
  task :migrate, [:version] do |_t, args|
    require 'sequel/core'
    require 'dotenv/load'

    Sequel.extension :migration
    version = args[:version].to_i if args[:version]
    Sequel.connect(DATABASE_URL) do |db|
      Sequel::Migrator.run(db, 'db/migrations', target: version)
    end
  end
end
