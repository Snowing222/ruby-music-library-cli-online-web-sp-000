class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path=path
  end

  def files
    Dir.glob("#{path}/*.mp3").map {|file| file.gsub("#{path}/","")}

  end

  def import
    files.map {|file| Song.create_from_filename(file)}
  end
end
