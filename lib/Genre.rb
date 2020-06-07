class Genre
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods
  attr_accessor :name
  attr_reader :songs
  @@all=[]

  def initialize(name) #initialize
    @name=name
    @songs=[]
  end

  def self.all #class reader
    @@all
  end

  def self.create(name) #custom constructor
    new(name).tap {|o|o.save}
  end

  def artists #search artists array
    songs.map {|song| song.artist}.uniq.compact
  end

end
