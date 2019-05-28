require 'rest-client'
require 'JSON'
# Movie.create(title: 'title', genre: 'genre', year: 'year', actors: 'actors', imdbRating: 2.4)
movie_data = RestClient.get('http://www.omdbapi.com/?s=romantic&apikey=1d1382f6')
parsed_movie_data = JSON.parse(movie_data)['Search']

ids = parsed_movie_data.collect do |movie|
  movie['imdbID']
end

ids.each do |id|
  data = RestClient.get("http://www.omdbapi.com/?i=#{id}&apikey=1d1382f6")
  parsed_data=JSON.parse(data)
  rating = parsed_data["imdbRating"].to_f
  Movie.create(title: parsed_data["Title"], genre: parsed_data["Genre"], year: parsed_data["Year"], actors: parsed_data["Actors"], imdbRating: rating)
end
