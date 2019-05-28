require 'rest-client'
require 'JSON'

movie_data = RestClient.get('http://www.omdbapi.com/?s=romantic&apikey=1d1382f6')
parsed_movie_data = JSON.parse(movie_data)['Search']

parsed_movie_data.each do |movie|
  id = movie['imdbID']
  data = RestClient.get("http://www.omdbapi.com/?i=#{id}&apikey=1d1382f6")
  parsed_data = JSON.parse(data)

  title = parsed_data['Title']
  genre = parsed_data['Genre']
  year = parsed_data['Year']
  actors = parsed_data['Actors']
  imdbRating = parsed_data['imdbRating'].to_f

  # Movie.create(title: title, genre: genre, year: year, actors: actors, imdbRating: imdbRating)
end
