class CommandLineInterface

  def greeting()
    puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
    puts "Hello! Please enter your first and last name."
    puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
    full_name = gets.chomp
    full_name
  end

  def validate_name(full_name)
    split_name = full_name.split
    if split_name.length == 1
      puts "Please enter your last name."
      last_name = gets.chomp
      split_name << last_name
    end
    puts "Thanks, #{split_name[0].downcase.capitalize}!"
  end

  def existing_user?(full_name)


  end

  def help()
    puts "-------------------------------------"
    puts "- help : displays this help message."
    puts "- exit : exits this program."
    puts "- menu : returns to main menu."
    puts "-------------------------------------"
    choice = gets.chomp.downcase
  end

  def menu()
    puts "-------------------------------------"
    puts "Select an option:"
    puts "1.) Search for movies."
    puts "2.) View your current queue."
    puts "3.) Modify your current queue."
    puts "4.) View the help menu."
    puts "5.) Exit."
    puts "-------------------------------------"
    choice = gets.chomp
  end

  def exit()
    puts "Goodbye."
  end

  def run()

    validate_name(greeting())

    ########menu################
    menu_choice = menu()
    if menu_choice == '1'

    elsif menu_choice == '2'

    elsif menu_choice == '3'

    elsif menu_choice == '4'
      help()
    elsif menu_choice == '5'
      exit()
    else
      puts "Invalid input. Please select an option from below:"
      menu()
    end

    ##########help##############
    help_choice = help()
    if help_choice == 'help'
      help()
    elsif help_choice == 'exit'
      exit()
    elsif help_choice == 'menu'
      menu()
    else
      puts "Invalid input. Please select an option from below:"
      help()
    end
    return exit()
  end
end
