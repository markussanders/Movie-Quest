require_relative '../config/environment'
require 'pry'

command = CommandLineInterface.new
command.run

amy = User.new(id: 1, name: "Amy Myers")
