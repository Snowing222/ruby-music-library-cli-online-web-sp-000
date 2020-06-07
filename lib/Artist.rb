class Artist
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods
  attr_accessor :name
  attr_reader :songs
  @@all=[]

  def initialize(name)
    @name=name
    @songs=[]
  end

  def self.all
    @@all
  end

  def self.create(name)
    new(name).tap {|o| o.save}
  end

  def add_song(song)
    song.artist=self unless song.artist
    songs<<song unless songs.include?(song)
  end

  def genres
     songs.map {|song| song.genre}.uniq.compact
  end

end
