class Song
    attr_accessor :artist, :name
  
    @@all = []

    def initialize(name)
        @name = name
        save()
    end

    def save
        @@all << self 
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song = self.new(filename.split(" - ")[1])
        artist = filename.split(" - ")[0]
        artist = Artist.new(artist)
        song.artist = artist
        song
    end

    
    def artist_name=(artist)
        artist = Artist.find_or_create_by_name(artist)
        self.artist = artist
    end 
end