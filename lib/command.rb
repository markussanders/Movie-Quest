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
    end
    found_movie = current_user.search_movie(user_input)
    puts "Search Results:"
    puts found_movie
    found_movie
  end

  def list_movie_titles
    puts "Your current queue includes:"
    movies = current_user.queue_selections.map { |q|
      Movie.where("id = ?", q.movie_id)
    }.flatten.uniq
    movies.each {|m| puts "--#{m.title}"}
  end

  def get_current_queue
    if current_user.queue_selections.length == 0
      puts "There are no movies in your queue."
      self.other_options
    end
    self.list_movie_titles
    self.other_options
  end

  def select_movie_to_add
    puts "Please enter the movie title you would like to add."
    movie_to_add = gets.chomp
    current_user.search_movie(movie_to_add)
  end

  def add_movie_to_queue?(movie)
    # movie = self.movie_to_add
    puts "Would you like to add this movie to your queue? (Y/N)"
    user_input = gets.chomp
    if user_input.downcase == 'y'
      puts "'#{movie.title}' has been added to your queue."
      current_user.add_queue_selection(movie)
    end
    self.other_options
  end

  def remove_movie_from_queue
    puts "Type the title of the movie you would like to remove:"
    self.list_movie_titles
    movie_title = gets.chomp
    puts current_user.remove_queue_selection(movie_title)
    self.other_options
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

  def other_options
    puts "Would you like to do something else? (Y/N)"
    user_input = gets.chomp.downcase
    user_input == 'y' ? self.run : (return self.exit)
  end

  def run
    menu_choice = self.menu
      if menu_choice == '1' #search for movies
        found_movie = self.search_for_movies
        add_movie_to_queue?(found_movie)
        self.other_options
      elsif menu_choice == '4' #view current queue
        self.get_current_queue
      elsif menu_choice == '5' #add to queue
        self.add_movie_to_queue?(select_movie_to_add)
      elsif menu_choice == '6' #modify queue
        self.remove_movie_from_queue
      elsif menu_choice == '7' #help
        self.help
      elsif menu_choice == '8' #exit
        self.exit
      else
        puts "Invalid input. Please select an option from below:"
        self.run
      end
  end

end
