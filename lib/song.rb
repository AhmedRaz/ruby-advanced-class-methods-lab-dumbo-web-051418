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
    song = self.new
    song.save
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
      song = self.new_by_name(name)
      song.save
      return song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      song = self.create_by_name(name)
      return song
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.parse_filename(file_name)
    file_name_parse = file_name.split(/[-.]/).map {|word| word.strip}
    return file_name_parse
  end

  def self.new_from_filename(file_name)
    song = self.new
    song.artist_name = self.parse_filename(file_name)[0]
    song.name = self.parse_filename(file_name)[1]

    return song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
    return song
  end

  def self.destroy_all
    self.all.clear
  end

end
