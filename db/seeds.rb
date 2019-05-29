require 'rest-client'
require 'JSON'
# http://www.omdbapi.com/?s=movie&page=2&apikey=1d1382f6
# movie_data = RestClient.get('http://www.omdbapi.com/?s=romantic&apikey=1d1382f6')
# parsed_movie_data = JSON.parse(movie_data)['Search']


def inital_parse
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
    genre = parsed_data['Genre']
    year = parsed_data['Year']
    actors = parsed_data['Actors']
    imdbRating = parsed_data['imdbRating'].to_f

    Movie.create(title: title, genre: genre, year: year, actors: actors, imdbRating: imdbRating)
  end
end
<<<<<<< HEAD

amy = User.new(id: 1, name: "Amy Myers")

=======
inital_parse
>>>>>>> 5e1267f9def1d22298da0896ae57cca2de995672
