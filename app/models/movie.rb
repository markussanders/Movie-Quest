class Movie < ActiveRecord::Base
    has_many :queue_selections
    has_many :stars
    has_many :users, through: :queue_selections
    has_many :actors, through: :stars
    
    def others_that_have_seen_movie
      self.users
    end
end
