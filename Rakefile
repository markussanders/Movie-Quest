require_relative 'config/environment'
require 'sinatra/activerecord/rake'

# amy = User.new(id: 1, name: "Amy Myers")

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end
