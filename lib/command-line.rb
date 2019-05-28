def greet_user
  puts "Hello! Please enter your first and last name."
  full_name = gets.chomp
end


def verify_user_name(greet_user)
  if greet_user.split.length == 1
    puts "Please enter both your first and last name."
    greet_user = gets.chomp
  end
  full_name = greet_user.split
  first_name = full_name[0]
  last_name = full_name[-1]

  puts "Thank you, #{first_name}!"
  new_full_name = "#{first_name} #{last_name}"
end

def stored_user_names

end
