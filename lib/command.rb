require 'pry'
class CommandLineInterface

  def greeting
    puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
    puts "Hello! Please enter your first and last name."
    puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
  end

  def get_name
    @user_name ||= gets.chomp.downcase
  end

  def validate_name
    split_name = @user_name.split

    if split_name.length == 1
      puts "Please enter your last name."
      last_name = gets.chomp
      split_name << last_name
    end
    @validated = split_name.map{|n| n.capitalize}.join(' ')
    puts "Welcome, #{@validated.split[0].capitalize}!"
  end

  def current_user
    User.find_or_create_by(name: @validated)
  end

  def menu
    puts "-------------------------------------"
    puts "Select an option:                   -"
    puts "1.) Search for movies by title      -"
    puts "2.) Search for movies by actor      -"
    puts "3.) Search for movies by genre      -"
    puts "4.) View your current queue.        -"
    puts "5.) Add a movie to your queue.      -"
    puts "6.) Remove a movie from your queue. -"
    puts "7.) View the help menu.             -"
    puts "8.) Exit.                           -"
    puts "-------------------------------------"
    choice = gets.chomp
  end

  def search_for_movies
    puts "Please enter the title of the movie you would like to search."
    user_input = gets.chomp
    if current_user.search_movie(user_input).nil?
      puts "Sorry, that title cant be found."
      # self.search_for_movies
      self.run
    end
    found_movie = current_user.search_movie(user_input)
    puts "Search Results:"
    found_movie
  end

  def get_current_queue
    puts "Your current queue includes:"
    puts current_user.queue_selections
  end

  def add_movie_to_queue?(movie)
    puts "Would you like to add this movie to your queue? (Y/N)"
    user_input = gets.chomp
    if user_input.downcase == 'y'
      puts "'#{movie.title}' has been added to your queue."
      current_user.add_queue_selection(movie)
    end
     self.run
  end

  def remove_movie_from_queue
    self.get_current_queue
    puts "Type the title of the movie you would like to remove."
    movie_title = gets.chomp
    puts current_user.remove_queue_selections(movie_title)
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
      self.run
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
    menu_choice = self.menu
      if menu_choice == '1' #search for movies
        found_movie = self.search_for_movies
        add_movie_to_queue?(found_movie)
        self.run
      elsif menu_choice == '4' #view current queue
        puts self.get_current_queue
        self.run
      elsif menu_choice == '5' #add to queue
        movie_to_add = self.search_for_movies
        binding.pry
        self.add_movie_to_queue?(movie_to_add)
        puts "Added #{movie_to_add.title} to your queue."
        self.run
      elsif menu_choice == '6' #modify queue
        puts self.remove_movie_from_queue
      elsif menu_choice == '7' #help
        self.help
      elsif menu_choice == '8' #exit
        self.exit
      else
        puts "Invalid input. Please select an option from below:"
        self.menu
      end
  end

end
