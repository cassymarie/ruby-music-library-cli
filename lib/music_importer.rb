class MusicImporter
extend Concerns::Findable
attr_accessor :path #, :files

     def initialize(filepath)
          @path = filepath
          # @files = []
     end

     def files
          Dir.children(@path)
     end

     def import
          self.files.each do |file|
               Song.create_from_filename(file)
          end 
     end
end
