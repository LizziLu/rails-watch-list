require 'json'
require 'open-uri'

Movie.destroy_all
puts "Deleting database"


url = 'http://tmdb.lewagon.com/movie/top_rated'
user_serialized = URI.open(url).read
movies = JSON.parse(user_serialized)["results"]

movies.each do |result|
  Movie.create(title: result["title"], rating: result["vote_average"], overview: result["overview"], poster_url:"https://image.tmdb.org/t/p/original#{result["poster_path"]}")
end

puts "Movies added"
