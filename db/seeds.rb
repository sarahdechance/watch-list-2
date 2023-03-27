# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require "open-uri"

p "Deleting data"
Bookmark.destroy_all
List.destroy_all
Movie.destroy_all

p "Creating new movies"

api_key = "26c26f5b0d2a2ca5076b4e5400fb5784"
url = "http://tmdb.lewagon.com/movie/top_rated?api_key=#{api_key}&language=en-US&page=1"
movies = JSON.parse(URI.open(url).read)

movies["results"].each do |movie|
  poster_url = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2#{movie["poster_path"]}"
  Movie.create!(title: movie["title"], overview: movie["overview"], poster_url: poster_url, rating: movie["vote_average"])
end

p "#{Movie.all.count} movies created"
