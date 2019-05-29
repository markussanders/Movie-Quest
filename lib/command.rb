require 'pry'
class CommandLineInterface

  def greeting
    puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
    puts "Hello! Please enter your first and last name."
    puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
  end

  def get_name
    name = gets.chomp.downcase
    name
  end

  def validate_name
    split_name = self.get_name.split

    if split_name.length == 1
      puts "Please enter your last name."
      last_name = gets.chomp
      split_name << last_name
    end
    puts "Thanks!"
    validated = split_name.map{|n| n.capitalize}.join(' ')
    validated
  end

  def current_user
    User.all.find_or_create_by(name: validate_name)
  end

  def menu
    puts "-------------------------------------"
    puts "Select an option:"
    puts "1.) Search for movies."
    puts "2.) View your current queue."
    puts "3.) Remove a movie from your queue."
    puts "4.) View the help menu."
    puts "5.) Exit."
    puts "-------------------------------------"
  end

  def search_for_movies(user_input)

    current_user.search_movie(user_input)
  end

  def get_current_queue
    puts "Your current queue includes:"
    puts current_user.get_movies
  end

  def remove_movie_from_queue
    self.get_current_queue
    puts "Type the title of the movie you would like to remove."
    movie_title = gets.chomp
    current_user.remove_queue_selections(movie_title)
  end

  def help
    puts "-------------------------------------"
    puts "- help : displays this help message.-"
    puts "- exit : exits this program.        -"
    puts "- menu : returns to main menu.      -"
    puts "-------------------------------------"
    choice = gets.chomp.downcase
  end

  def exit
    return "Goodbye (▰˘︹˘▰)"
  end

  def run
    greeting
    validate_name
    choice = gets.chomp.chomp
    menu_choice = choice
    if menu_choice == '1' #search for movies
        puts "Please enter the title of the movie you would like to search."
        movie_input=gets.chomp
        movie = self.search_for_movies(movie_input)
        puts "Search Results:"
        puts movie.title
    elsif menu_choice == '2' #view current queue
        self.get_current_queue
    elsif menu_choice == '3' #modify queue
        self.remove_movie_from_queue
    elsif menu_choice == '4' #help
        self.help
    elsif menu_choice == '5' #exit
        self.exit
    else
        puts "Invalid input. Please select an option from below:"
        self.menu
    end
    help_choice = self.help
      if help_choice == 'help'
        self.help
      elsif help_choice == 'exit'
        self.exit
      elsif help_choice == 'menu'
        self.menu
      else
        puts "Invalid input. Please select an option from below:"
        self.help
      end
  end

end
