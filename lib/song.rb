class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def self.create
    song = self.new
    song.name = name
    @@all << song
    song
  end
  
  def self.new_by_name(song_str)
    song = self.new
    song.name = song_str
    song
  end
  
  def self.create_by_name(song_str)
    song = self.new
    song.name = song_str
    @@all << song
  end
    

  def save
    self.class.all << self
  end

end
