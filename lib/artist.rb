require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs

  # Class variable to store all the artist objects
  @@artists = []

  def initialize
    @@artists << self  # Add the current artist object to the @@artists array
    @songs = []  # Initialize an empty array to store the artist's songs
  end

  def self.find_by_name(name)
    # Find an artist in the @@artists array based on the given name
    @@artists.detect { |artist| artist.name == name }
  end

  def self.all
    @@artists  # Return the array of all artist objects
  end

  def self.reset_all
    self.all.clear  # Clear the @@artists array to reset the artist collection
  end

  def self.count
    self.all.count  # Return the count of artist objects in the @@artists array
  end

  def add_song(song)
    @songs << song  # Add the song to the artist's songs array
    song.artist = self  # Set the artist for the song
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }  # Add multiple songs to the artist's songs array
  end

  def to_param
    name.downcase.gsub(' ', '-')  # Generate a URL-friendly parameter based on the artist name
  end
end
