require 'faker'
# seed some movies
puts 'Creating 20 fake movies...'

Movie.destroy_all

20.times do
  movie = Movie.new(
    title: Faker::Name.name,
    overview: Faker::Quotes::Shakespeare.hamlet_quote,
    rating:  (rand(0.1..5.0).round(2)),
    poster_url: Faker::Internet.url)
  movie.save!
end

puts "Finished! Created #{Movie.count} movies"
