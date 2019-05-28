def greet_user
  puts "Hello! Please enter your first and last name."
  full_name = gets.chomp
end

def verify_user_name(greet_user)

  if greet_user.split.length == 1
    puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
          \nPlease enter both your first and last name.
          \n-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
    greet_user = gets.chomp
  end
  full_name = greet_user.split
  first_name = full_name[0]
  last_name = full_name[-1]

  puts "Thank you, #{first_name}!"
  new_full_name = "#{first_name.downcase} #{last_name.downcase}"
end

def stored_user_names
  # search user db for names matching username
  # find - return user and user queue of movies
  # create - new user
end

# def exit(input)
#   if input.downcase == 'exit'
#     false
#   end
# end

def help
  puts "\n
  - help : displays this help message
  - exit : exits this program"
end
