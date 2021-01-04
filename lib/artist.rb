require 'pry'

class Artist
    attr_accessor :name

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

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def print_songs
        Song.all.each do |song| 
            if song.artist == self 
                puts song.name
            end
        end
    end

    def self.find_or_create_by_name(name)
        #self.all.find {|artist| artist.name == name } ? self.all.find {|artist| artist.name == name } : self.new(name)

        x = self.all.find do |artist|
            if artist.name == name
                artist
            end
        end
        x ? x : self.new(name)
    end
end