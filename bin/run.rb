require_relative '../config/environment'
require 'pry'

command = CommandLineInterface.new

command.run
binding.pry
puts "HELLO WORLD"
