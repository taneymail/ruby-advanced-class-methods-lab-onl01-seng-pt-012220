class Song
  attr_accessor :name, :artist_name
  @@all = []

  @@all = Array.new

  def self.create
    new_song = self.new
    new_song.save
    return new_song
  end

  def self.all
    @@all
  end

 
  def save
    self.class.all << self
  end

end
  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song   
  end 

  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    result = nil
    @@all.each do |song|
      result = song if song.name == song_name    
    end
    result  
  end

  def self.find_or_create_by_name(song_name)
    if find_by_name(song_name) == nil
      create_by_name(song_name)
    else
      find_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    filename[1] = filename[1].chomp(".mp3")
    song = self.new
    song.artist_name = filename[0]
    song.name = filename[1]
    song
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all = Array.new
  end
end

