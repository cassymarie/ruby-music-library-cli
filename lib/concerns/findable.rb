module Concerns
     module Findable

          def create(name)
               createSong = Song.new(name)
               createSong.save
               createSong
          end     
          
          def find_by_name(name)
               self.all.detect {|song| song.name == name}
          end
     
          def find_or_create_by_name(name)
              self.find_by_name(name) || self.create(name) 
          end

          def new_from_filename(file)
               file_arr = file.split(' - ')
               newArtist = Artist.find_or_create_by_name(file_arr[0])
               newGenre = Genre.find_or_create_by_name(file_arr[2].delete_suffix(".mp3"))
               Song.new(file_arr[1],newArtist,newGenre)
          end
          def create_from_filename(file)
               newSong = new_from_filename(file)
               newSong.save
          end
     end
end