require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist

  # Class variable to store all the song objects
  @@songs = []

  def initialize
    @@songs << self  # Add the current song object to the @@songs array
  end

  def self.find_by_name(name)
    # Find a song in the @@songs array based on the given name
    @@songs.detect { |song| song.name == name }
  end

  def self.all
    @@songs  # Return the array of all song objects
  end

  def self.reset_all
    self.all.clear  # Clear the @@songs array to reset the song collection
  end

  def self.count
    self.all.count  # Return the count of song objects in the @@songs array
  end

  def artist=(artist)
    @artist = artist  # Set the artist for the song
  end

  def to_param
    name.downcase.gsub(' ', '-')  # Generate a URL-friendly parameter based on the song name
  end
end
