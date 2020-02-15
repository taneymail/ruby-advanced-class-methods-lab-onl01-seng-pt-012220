 self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find{|x| x.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    name = data[1].chomp(".mp3")
    artist = data[0]
    song = self.new
    song.name = name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    name = self.new_from_filename(filename)
    name.save
  end

  def self.destroy_all
    self.all.clear
  end

end
