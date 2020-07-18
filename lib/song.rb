class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self #why is .class neccessary? Can it just be self.all << self ?
  end

  def self.create #CREATE, RUN, SAVE
    song = self.new  #instantiate
    song.save
    song  #call song because song.save is not going to call song for us
  end

  def self.new_by_name(name) #CREATE, RUN, DIDNT SAVE
    song = self.new
    song.name = name  #tried to use self.name = name instead of song.name = failed
    song #returning because it is on the last line? prints to terminal?
  end

  def self.create_by_name(name) #CREATE, RUN, SAVE
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name) #LOOK IN ARRAY FOR SONGS THAT MATCH NAME
    @@all.detect{ |song| song.name == name } #grabs element of the arry and returns
    #.find/detect will look for object then return, not .include
  end

  def self.find_or_create_by_name(name) #OR = boolean ||
     self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
     self.all.sort_by{ |song| song.name } #can I use @@all here? @@all vs self
  end

  def self.new_from_filename(filename)
    split_filename = filename.chomp(".mp3").split(" - ") #where did split_ come from?
    song = self.new #why not self?
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end
  
  def self.create_from_filename(filename)
    split_filename = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = split_filename[1] #why use indices?
    song.artist_name = split_filename[0]
    song.save #to save results?
    song #used to return?
  end

  def self.destroy_all #EMPTIES
    @@all = []
  end

end
