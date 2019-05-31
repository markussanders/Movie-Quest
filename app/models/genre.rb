class Genre < ActiveRecord::Base
    has_many :movie_genres
    has_many :movies, through: :movie_genres

    def self.list_of_all_genres
<<<<<<< HEAD
        self.all.map {|x| puts x.name}
    end
=======
      self.all.map {|x| puts x.name}
    end

>>>>>>> 3749e475b22c275cc78112272cfb394e4153848c
end
