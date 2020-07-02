require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    #init a song and saves it to the @@alll
    #either literally or through the class method Song.all
    song = self.new
    song.name = name
    #song.artist_name = @artist_name
    #binding.pry
    @@all << song
    song
    #return the song instance what was init and saved
  end

  def self.new_by_name(song_str)
    song = self.new
    song.name = song_str
    #binding.pry
    song
  end

  def self.create_by_name(song_str)
    song = self.new
    song.name = song_str
    @@all << song
    song
  end

  def self.find_by_name(song_str)
    @@all.find{|songs| songs.name == song_str}
    #binding.pry
  end

  def self.find_or_create_by_name(song_str)
    if find_by_name(song_str)
      find_by_name(song_str)
    else
      create_by_name(song_str)
    end
  end

  def self.alphabetical
    #!!!you can sort an object by an attribute
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    file_array = filename.split(/[-.]/)
    song = self.new
    #binding.pry
    song.artist_name = file_array[0].strip
    song.name = file_array[1].strip
    song
  end

  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
    @@all << new_song
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

end
