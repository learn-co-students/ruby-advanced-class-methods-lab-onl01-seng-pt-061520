class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    song= self.new
    @@all << song
    song
  end
  
  def Song.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def Song.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def Song.find_by_name(name)
    @@all.find do |x| 
      x.name == name
    end
  end

  def Song.find_or_create_by_name(name)
    if self.find_by_name(name) == nil 
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def Song.alphabetical
    @@all.sort_by{|x| x.name}
  end
  
  def self.new_from_filename(name)
    song = self.new 
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    song
  end

  def Song.create_from_filename(name)
    song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    @@all << song
    song
  end

  def Song.destroy_all
    @@all.clear
  end

end
