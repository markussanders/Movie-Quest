class User < ActiveRecord::Base
    has_many :queue_selections
    has_many :movies, through: :queue_selections

<<<<<<< HEAD
    def search_movie(movie_input)
        Movie.all.select do |movie|
            movie[:title].downcase == movie_input.downcase
        end
=======
    def search_movie

>>>>>>> 5609dcd6fd73835480d0881529670522e5c5c982
    end

    def get_movies
        self.queue_selections
    end

    def add_queue_selection(queue_selection)

    end

    def remove_queue_selection(queue_selection)

    end

end
