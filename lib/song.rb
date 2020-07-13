require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.create
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    @@all.find {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name) == nil
      Song.create_by_name(name)
    else
      Song.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|s| s.name}
  end

  def self.new_from_filename(file)
    array = file.split(" - ")
    array[1] = array[1].split(".").delete_at(0)
    song = Song.new
    song.name = array[1]
    song.artist_name = array[0]
    song
  end

  def self.create_from_filename(file)
    song = Song.new_from_filename(file)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end

end
