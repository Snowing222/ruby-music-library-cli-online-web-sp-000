class Song
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods
  attr_accessor :name
  attr_reader :artist, :genre
  @@all=[]

  def initialize(name,artist=nil,genre=nil)
    @name=name
    self.artist=artist if artist
    self.genre=genre if genre
  end

  def artist=(artist) #Special artist attr setter
    @artist=artist
    artist.add_song(self)
  end

  def genre=(genre) #Special genre attr setter
    @genre=genre
    genre.songs<<self unless genre.songs.include?(self)
  end

  def self.all #Class reader
    @@all
  end

  def self.create(name) #Custom constructor
    new(name).tap {|o|o.save}
  end

  def self.new_from_filename(file_name) #Custom constructor
    file=file_name.gsub(".mp3","")
    artist_name=file.split(" - ")[0]
    song_name=file.split(" - ")[1]
    genre_name=file.split(" - ")[2]
    @name=song_name
    artist=Artist.find_or_create_by_name(artist_name)
    genre=Genre.find_or_create_by_name(genre_name)
    Song.new(song_name,artist,genre)
  end

  def self.create_from_filename(name) #Custom constructor
    new_from_filename(name).tap{|o|o.save}
  end

end
