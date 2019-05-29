class User < ActiveRecord::Base
    has_many :queue_selections
    has_many :movies, through: :queue_selections

    def search_movie

    end

    def get_movies
        self.queue_selections
    end

    # def view_queue => amy.queue_selections
    #     QueueSelection.all.select do |queue_selection|
    #         queue_selection.all.user_id == self.user_id
    #     end
    # end

    def add_queue_selection(movie)
        new_movie_id = search_movie(movie).id
        # binding.pry
        QueueSelection.new(user_id: self.id, movie_id: new_movie_id).save
    end

    def remove_queue_selection(movie)
        pending_deletion_movie_id = search_movie(movie).id
        
        self.queue_selections.find_by(movie_id: pending_deletion_movie_id).destroy

    end

end
