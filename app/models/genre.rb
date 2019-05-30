class Genre < ActiveRecord::Base
    has_many :movie_genres
    has_many :movies, through: :movie_genres

    def self.list_of_all_genres
        self.all.map {|x| puts x.name}
    end
end
