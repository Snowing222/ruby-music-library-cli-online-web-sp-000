class Genre
  attr_accessor :name
  attr_reader :songs
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

  def artists
    songs.map {|song| song.artist}.uniq.compact
  end

end
