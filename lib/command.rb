require 'pry'
class CommandLineInterface

  def greeting
    puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
    puts "Hello! Please enter your first and last name."
    puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
  end

  def get_name
    @user_name ||= gets.chomp.downcase
    @user_name
  end

  def validate_name
    split_name = self.get_name.split

    if split_name.length == 1
      puts "Please enter your last name."
      last_name = gets.chomp
      split_name << last_name
    end
    @validated = split_name.map{|n| n.capitalize}.join(' ')
    @validated
  end

  def current_user
    p validated = validate_name
    User.find_or_create_by(name: @validated)
  end

  def menu
    puts "-------------------------------------"
    puts "Select an option:                   -"
    puts "1.) Search for movies.              -"
    puts "2.) View your current queue.        -"
    puts "3.) Add a movie to your queue.      -"
    puts "4.) Remove a movie from your queue. -"
    puts "5.) View the help menu.             -"
    puts "6.) Exit.                           -"
    puts "-------------------------------------"
    choice = gets.chomp
  end

  def search_for_movies
    puts "Please enter the title of the movie you would like to search."
    user_input = gets.chomp
    if current_user.search_movie(user_input).nil?
      puts "Sorry, that title cant be found."
      # self.search_for_movies
      self.menu
    end
    current_user.search_movie(user_input)
  end

  def get_current_queue
    puts "Your current queue includes:"
    puts current_user.queue_selections
  end

  def add_movie_to_queue?(movie)
    puts "Would you like to add this movie to your queue? (Y/N)"
    user_input = gets.chomp
    if user_input.downcase == 'y'
      current_user.add_queue_selection(movie)
      puts "'#{movie.title}' has been added to your queue."
    end
    self.menu
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
    if choice == 'help'
      self.help
    elsif choice == 'exit'
      self.exit
    elsif choice == 'menu'
      self.menu
    else
      puts "Invalid input. Please select an option from below:"
      self.help
    end
  end

  def exit
    puts "Goodbye (▰˘︹˘▰)"
    return
  end

  def run
    greeting
    validate_name
    puts "Welcome, #{@user_name.split[0].capitalize}!"
    menu_choice = self.menu
      if menu_choice == '1' #search for movies
        found_movie = self.search_for_movies
        puts "Search Results:"
        puts found_movie.title
        puts "___________________________"
        add_movie_to_queue?(found_movie)
      elsif menu_choice == '2' #view current queue
        self.get_current_queue
      elsif menu_choice == '3' #add to queue
        movie_to_add = self.search_for_movies
        self.add_movie_to_queue?(movie_to_add)
        puts "Added #{movie_to_add.title} to your queue."
      elsif menu_choice == '4' #modify queue
        self.remove_movie_from_queue
      elsif menu_choice == '5' #help
        self.help
      elsif menu_choice == '6' #exit
        self.exit
      else
        puts "Invalid input. Please select an option from below:"
        self.menu
      end
  end

end
