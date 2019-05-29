class User < ActiveRecord::Base
    has_many :queue_selections
    has_many :movies, through: :queue_selections

    def search_movie(movie_input)
        Movie.all.select do |movie|
            movie[:title].downcase == movie_input.downcase
        end[0]
    end

    def add_queue_selection(movie)
        new_movie_id = search_movie(movie).id
        # binding.pry
        QueueSelection.new(user_id: self.id, movie_id: new_movie_id).save
    end

    def remove_queue_selection(movie)

        self.queue_selections = self.queue_selections.reject do |queue_selection|
            queue_selection.movie_id == search_movie(movie).id
        end
    end

end
