class Genre
  attr_accessor :name
  @@all=[]
  extend Concerns::Findable

  def initialize(name)
    @name=name
    @songs=[]
  end

  def self.all
    @@all
  end

  def save
    self.class.all<<self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    new(name).tap {|o|o.save}
  end

  def songs
    @songs
  end

  def artists
    songs.map {|song| song.artist}.uniq.compact
  end

end
