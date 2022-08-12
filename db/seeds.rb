# require 'faker'
# # seed some movies
# puts 'Creating 20 fake movies...'

# Movie.destroy_all

# 20.times do
#   movie = Movie.new(
#     title: Faker::Name.name,
#     overview: Faker::Quotes::Shakespeare.hamlet_quote,
#     rating: rand(0.1..5.0).round(2),
#     poster_url: Faker::Internet.url)
#   movie.save!
# end

# puts "Finished! Created #{Movie.count} movies"

require "json"
require "open-uri"

Movie.destroy_all

url = "https://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)
movies_array = movies["results"]

movies_array.each do |movie|
  title = movie["title"]
  overview = movie["overview"]
  rating = movie["vote_average"]
  poster = "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}"
  new_movie = Movie.new(title: title, overview: overview, rating: rating, poster_url: poster)
  new_movie.save!
  puts "added #{movie["title"]}"
end
