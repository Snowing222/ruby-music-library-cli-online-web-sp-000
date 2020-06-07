class MusicLibraryController
  def initialize(path="./db/mp3s")
    path ? MusicImporter.new(path).import : MusicImporter.new("./db/mp3s").import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

   input=""
   while input!="exit"
   input=gets.strip
   case input
   when "list songs"
     list_songs
   when "list artists"
     list_artists
   when "list genres"
     list_genres
   when "list artist"
     list_songs_by_artist
   when "list genre"
     list_songs_by_genre
   when "play song"
     play_song
   end
 end

end

 def list_songs
   i=0
   Song.all.sort_by{|song|song.name}.each do |song|
     i+=1
     puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
 end
 end

 def list_artists
   i=0
   Artist.all.sort_by{|artist|artist.name}.each do |artist|
     i+=1
     puts "#{i}. #{artist.name}"
   end
 end

 def list_genres
   i=0
   Genre.all.sort_by{|genre|genre.name}.each do |genre|
     i+=1
     puts "#{i}. #{genre.name}"
   end
 end

 def list_songs_by_artist
   puts "Please enter the name of an artist:"
   artist_name=gets
   i=0
   if artist=Artist.find_by_name(artist_name)
      sort_songs=artist.songs.sort_by{|song|song.name}
      sort_songs.map do |song|
      i+=1
      puts "#{i}. #{song.name} - #{song.genre.name}"
    end
   end
 end

 def list_songs_by_genre
   puts "Please enter the name of a genre:"
   genre_name=gets
   i=0
   if genre=Genre.find_by_name(genre_name)
      sort_songs=genre.songs.sort_by{|song|song.name}
      sort_songs.map do |song|
      i+=1
      puts "#{i}. #{song.artist.name} - #{song.name}"
    end
   end
 end

 def play_song
   puts "Which song number would you like to play?"
   number=gets.to_i
   if number>0 && number<=Song.all.length
     song=Song.all.sort_by { |x| x.name }[number-1]
     puts "Playing #{song.name} by #{song.artist.name}"
   end
 end
end
