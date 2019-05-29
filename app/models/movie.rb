class Movie < ActiveRecord::Base
    has_many :queue_selections
    has_many :stars
    has_many :movie_genres
    has_many :users, through: :queue_selections
    has_many :actors, through: :stars
    has_many :genres, through: :movie_genres

    def others_that_have_seen_movie
      self.users
    end
end
