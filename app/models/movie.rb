class Movie < ActiveRecord::Base
    has_many :queue_selections
<<<<<<< HEAD
    has_many :users, through: :queue_selection
    
    
=======
    has_many :stars
    has_many :movie_genres
    has_many :users, through: :queue_selections
    has_many :actors, through: :stars
    has_many :genres, through: :movie_genres

    def others_that_have_seen_movie
      self.users
    end
>>>>>>> 5609dcd6fd73835480d0881529670522e5c5c982
end
