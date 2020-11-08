
class MusicLibraryController
extend Concerns::Findable
attr_accessor :path
CHOICES = ['list songs','list artists','list genres','list artist','list genre','play song','exit']

     def initialize(path='./db/mp3s')
          @path = path
          new_library = MusicImporter.new(@path).import
     end
     
     def call
          puts "Welcome to your music library!"
          puts "To list all of your songs, enter 'list songs'."
          puts "To list all of the artists in your library, enter 'list artists'."
          puts "To list all of the genres in your library, enter 'list genres'."
          puts "To list all of the songs by a particular artist, enter 'list artist'."
          puts "To list all of the songs of a particular genre, enter 'list genre'."
          puts "To play a song, enter 'play song'."
          puts "To quit, type 'exit'."
          puts "What would you like to do?"
          user_input = gets.chomp
          until CHOICES.include?(user_input) do 
               puts "invalid entry, please make a different choice"
               user_input = gets.chomp
          end

          case user_input
          when "list songs"
               list_songs
          when "list artists"
               list_artists
          when "list genres"
               list_genres
          when "list artist"
               list_songs_by_artist
          when "list genre"
               list_songs_by_genre
          when "play song"
               play_song
          end
     end

     def list_songs
          Song.all.sort{|a, b| a.name <=> b.name}.each_with_index do |song, i|
               puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
     end

     def list_artists
          Artist.all.sort{|a, b| a.name <=> b.name}.each_with_index do |artist, i|
               puts "#{i+1}. #{artist.name}"
          end
     end

     def list_genres
          Genre.all.sort{|a, b| a.name <=> b.name}.each_with_index do |genre, i|
               puts "#{i+1}. #{genre.name}"
          end
     end

     def list_songs_by_artist
          puts "Please enter the name of an artist:"
          user_input = gets.chomp
          #  list_artist = Artist.all.find{|artist| artist.name == user_input}
           if list_artist = Artist.find_by_name(user_input)
               list_artist.songs.sort{|a, b| a.name <=> b.name}.each_with_index do |song, i| 
                    puts "#{i+1}. #{song.name} - #{song.genre.name}"
               end
          end
     end

     def list_songs_by_genre
          puts "Please enter the name of a genre:"
          user_input = gets.chomp

           if song_list = Genre.find_by_name(user_input)
               song_list.songs.sort{|a, b| a.name <=> b.name}.each_with_index do |song, i|
                    puts "#{i+1}. #{song.artist.name} - #{song.name}"
               end
          end
     end

     def play_song
          puts "Which song number would you like to play?"
          user_input = gets.strip.to_i

          if user_input > 0 && user_input <= Song.all.length
               song_arr = Song.all.sort{|a, b| a.name <=> b.name}
               play_song = song_arr[user_input-1]
               puts "Playing #{play_song.name} by #{play_song.artist.name}"
          end

     end

end
