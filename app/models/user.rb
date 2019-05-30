require 'pry'

class User < ActiveRecord::Base
    has_many :queue_selections
    has_many :movies, through: :queue_selections

    def search_movie(movie_input)
<<<<<<< HEAD
        Movie.all.find do |movie|
            movie.title.downcase == movie_input.downcase
        end
=======
        input = movie_input.downcase
        Movie.where("LOWER(title) = ?", input)[0]
>>>>>>> dbb6aa72e76da2518d6041a8c417ae395f4497f4
    end

    def add_queue_selection(movie)
        new_movie_id = search_movie(movie.title).id
        QueueSelection.new(user_id: self.id, movie_id: new_movie_id).save
    end

    def remove_queue_selection(movie)

        self.queue_selections = self.queue_selections.reject do |queue_selection|
            queue_selection.movie_id == search_movie(movie).id
        end
    end

end

