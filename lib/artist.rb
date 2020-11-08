class Artist
extend Concerns::Findable
attr_accessor :name, :songs, :genre
@@all = []

     def initialize(name)
          @name = name
          @songs = []
     end

     def save
          @@all << self unless @@all.include?(self)
     end

     def self.create(name)
          newArtist = Artist.new(name)
          newArtist.save
          newArtist
     end

     def self.all
          @@all
     end

     def songs
         @songs
     end

     def genres
          self.songs.collect {|song| song.genre}.uniq
     end  

     def add_song(song)
          song.artist = self if song.artist.nil? 
          @songs << song unless @songs.include?(song)
     end

     def self.destroy_all
          self.all.clear
     end

end
