class User < ActiveRecord::Base
    has_many :queue_selections
    has_many :movies, through: :queue_selections

    def search_movie
        
    end

    def get_movies
        self.queue_selections
    end

    def add_queue_selection(queue_selection)

    end

    def remove_queue_selection(queue_selection)

    end

end