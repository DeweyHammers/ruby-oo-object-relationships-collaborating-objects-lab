class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        Dir.entries(path).map { |e| e if e.delete(' ') =~ /\w/ }.compact
    end

    def import
        files.each {|file_name| Song.new_by_filename(file_name)}
    end
end