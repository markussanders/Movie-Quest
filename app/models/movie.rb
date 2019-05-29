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

  def user_queue_count
    users.count
  end

  def actors_list
    actors
  end

  def self.all_by_genre(genre)
    genre_name=genre.split(" ").collect{|genre_name| genre_name.capitalize}.join(" ")
    genre_id = Genre.all.find_by(name: genre_name).id
    Genre.all[genre_id].movies
  end

  def self.all_by_actor(actor)
    actor_name=actor.split(" ").collect{|actor_name| actor_name.capitalize}.join(" ")
    actor_id = Actor.all.find_by(name: actor_name).id
    Actor.all[actor_id].movies
  end
end
