require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
require_all 'app'
ActiveRecord::Base.logger = nil

# amy = User.new(id: 1, name: "Amy Myers")
amy = User.new(id: 87, name: "Amy")

