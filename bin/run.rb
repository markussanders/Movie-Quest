require_relative '../config/environment'
require 'pry'

command = CommandLineInterface.new
command.greeting
command.get_name
command.validate_name
command.run
