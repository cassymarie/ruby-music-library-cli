class Genre
extend Concerns::Findable
attr_accessor :name, :songs
@@all = []

     def initialize(name, song = nil)
          @name = name
          self.song = song if song
          @songs = []
          save
     end

     def save
          @@all << self unless @@all.include?(self)
     end

     def songs
          @songs
     end

     def artists
          self.songs.collect {|song| song.artist}.uniq
     end

     def self.create(name)
          newGenre = Genre.new(name)
          newGenre.save
          newGenre
     end

     def self.all
          @@all
     end

     def self.destroy_all
          self.all.clear
     end

end
