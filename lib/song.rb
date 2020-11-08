

class Song
extend Concerns::Findable     
attr_accessor :name, :artist, :genre
@@all = []

     def initialize(name, artist = nil, genre = nil)
          @name = name
          self.artist = artist if artist && artist.class == Artist
          self.genre = genre if genre
          save
     end

     def save
          @@all << self unless @@all.include?(self)
     end

     def artist=(artist)
          @artist = artist 
          artist.add_song(self) unless artist.nil?
     end

     def genre=(genre)
          @genre = genre 
          genre.songs << self unless genre.songs.include?(self)
     end

     def self.all
          @@all
     end

     def self.destroy_all
          self.all.clear
     end

end
