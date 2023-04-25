class App
  attr_accessor :items

  def initialize
    @games = []
    @functions = {
      9 => :add_item_music,
      10 => :add_item_game
    }
  end

  def trigger(int)
    send(@functions[int])
  end
  
  def list_genres
    if @genres2.nil? || @genres2.empty?
      puts 'No genres have been added yet.'
    else
      puts 'Current genres:'
      @genres2.each_with_index do |genre, index|
        puts "#{index + 1}. Genre:#{genre.name}. Album Name:#{genre.album_name}. On Spotify?#{genre.on_spotify}"
      end
    end
  end


  def input_getter(msj, is_number: false)
    print msj
    is_number ? gets.chomp.to_i : gets.chomp
  end

  def add_item_game()
    multiplayer = input_getter('Is this game multiplayer? [Y/N]: ')
    return add_item_game if multiplayer.capitalize != 'Y' && multiplayer.capitalize != 'N'

    multiplayer_bool = multiplayer.capitalize == 'Y'

    print 'Last time played date (yyyy-mm-dd): '
    last_played_at = gets.chomp

    print 'Publucation date (yyyy-mm-dd): '
    publish_date = gets.chomp

    game = Game.new(multiplayer_bool, last_played_at, publish_date)
    puts game.author.first_name
  end

  def add_item_music()
    on_spotify = input_getter('Is this album on spotify? [Y/N]: ')
    return add_item_music if on_spotify.capitalize != 'Y' && on_spotify.capitalize != 'N'

    on_spotify_boolean = on_spotify.capitalize == 'Y'

    print 'published date (yyyy-mm-dd): '
    publish_date = gets.chomp
    music_album = MusicAlbum.new(on_spotify_boolean, Date.new(publish_date.to_i))
    puts music_album
    p music_album.can_be_archived?
  end
end
