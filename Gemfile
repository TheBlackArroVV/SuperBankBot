source 'https://rubygems.org'

ruby '2.7.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'pg'
gem 'pry'
gem 'rubocop', require: false
gem 'sequel'
gem 'telegram-bot-ruby'
