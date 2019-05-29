require 'rest-client'
require 'JSON'
require_relative '../config/environment.rb'
# http://www.omdbapi.com/?s=movie&page=2&apikey=1d1382f6
# movie_data = RestClient.get('http://www.omdbapi.com/?s=romantic&apikey=1d1382f6')
# parsed_movie_data = JSON.parse(movie_data)['Search']


def initial_parse
  page=1
  while page <= 10 do
    movie_data = RestClient.get("http://www.omdbapi.com/?s=movie&page=#{page}&apikey=1d1382f6")
    parsed_movie_data = JSON.parse(movie_data)['Search']
    more_detailed_search(parsed_movie_data)
    page+=1
  end
end

def more_detailed_search(parsed_movie_data)
  parsed_movie_data.each do |movie|
    id = movie['imdbID']
    data = RestClient.get("http://www.omdbapi.com/?i=#{id}&apikey=1d1382f6")
    parsed_data = JSON.parse(data)

    title = parsed_data['Title']
    genre_list = create_genres(parsed_data['Genre'].split(", "))
    year = parsed_data['Year']
    actor_list=create_actors(parsed_data['Actors'].split(", "))
    imdbRating = parsed_data['imdbRating'].to_f

    created_movie = Movie.find_or_create_by(title: title, year: year, imdbRating: imdbRating)
    created_movie.actors << actor_list
    created_movie.genres << genre_list
  end
end

def create_actors(actors)
  actors.collect do |actor_name|
    Actor.find_or_create_by(name: actor_name)
  end
end

def create_genres(genres)
  genres.collect do |genre_name|
    Genre.find_or_create_by(name: genre_name)
  end
end

initial_parse
# amy = User.new(id: 1, name: "Amy Myers")
