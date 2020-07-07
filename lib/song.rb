require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

 def Song.create
  song = Song.new 
  Song.all << song
  song
 end 

  def Song.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end 
 
  def Song.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end 
  
  def Song.find_by_name(name)
    #Use .find iterator to find the song
    Song.all.find {|song| song.name == name}
  end 
  
  def Song.find_or_create_by_name(name)
    if  Song.find_by_name(name) == nil #checks if song does NOT exist
        Song.create_by_name(name) #creates song if the song does not exist
      else 
        Song.find_by_name(name) #returns the song instance
    end 
  end 
  
  def Song.new_from_filename(filename)
    # rows = filename.split("\n")
    # songs = rows.collect do |row|
    data = filename.split(" - ")
    artist_name = data [0]
    name = data [1]
    name = name.split('.mp3').join()
    song = Song.new
    song.name = name
    song.artist_name = artist_name
    song 
    # binding.pry
  # end 
  end 
  
  def Song.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
  end 
  
  def Song.alphabetical
   @@all.sort_by {|song| song.name}
  end 
  
  def self.all
    @@all
  end
  
  def Song.all
    @@all
  end 
 
  def save
    self.class.all << self
  end
  
  def Song.destroy_all
    @@all.clear
  end 
end
