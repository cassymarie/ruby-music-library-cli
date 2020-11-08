require 'pry'

require_relative '../lib/concerns/findable.rb'
require_relative '../lib/artist.rb'
require_relative '../lib/song.rb'
require_relative '../lib/genre.rb'
require_relative '../lib/music_importer.rb'
require_relative '../lib/music_library_controller.rb'




beyonce = Artist.create("Beyonce")
britney = Artist.create("Britney")
queen = Artist.create("Queen")
kpop = Artist.create("K-Pop")
bruno = Artist.create("Bruno Mars")

rap = Genre.new("Rap")
classic = Genre.new("Classic Rock")
pop = Genre.new("Pop")
funk = Genre.new("Funk")

song1 = Song.new("Hit me Baby", britney, pop)
song2 = Song.new("Bohemian Rap", queen, classic)
song3 = Song.new("Uptown Funk", bruno, funk)
song4 = Song.new("If I were a boy", beyonce, pop)
song5 = Song.new("Somebody to love", queen, classic)
song6 = Song.new("Ego", beyonce, rap)
song7 = Song.new("We will Rock You", queen, pop)

binding.pry
puts "let us pry"