require "imdb"
require "pry"
i = Imdb::Search.new("Ghostbusters")
#binding.pry
puts i.movies[0].title
puts i.movies[0].rating
#puts i.movies.size