class App
  attr_accessor :games

  def initialize()
    @games = []
    @music_albums = []
    @books = []
    @functions = {
      3 => :list_all_games,
      6=> :list_all_authors,
      7 => :add_item_book,
      8 => :add_item_music,
      9 => :add_item_game
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

    @games << Game.new(multiplayer_bool, last_played_at, Date.new(publish_date.to_i))
    puts ['Game created succesfully', '']
  end

  def add_item_music()
    on_spotify = input_getter('Is this album on spotify? [Y/N]: ')
    return add_item_music if on_spotify.capitalize != 'Y' && on_spotify.capitalize != 'N'

    on_spotify_boolean = on_spotify.capitalize == 'Y'

    print 'published date (yyyy-mm-dd): '
    publish_date = gets.chomp
    MusicAlbum.new(on_spotify_boolean, Date.new(publish_date.to_i))
  end

  def add_item_book()
    print 'Please enter the publisher: '
    publisher = gets.chomp

    print 'Describe the cover state of the book: '
    cover_state = gets.chomp

    print 'published date (yyyy-mm-dd): '
    publish_date = gets.chomp

    Book.new(Date.new(publish_date.to_i), publisher, cover_state)
  end

  def list_all_games
    if @games.empty?
      puts 'There are not created games yet'
    else
      @games.each do |game|
        print "Title: '#{game.label.title}, Author: '#{game.author.first_name} #{game.author.last_name}'"
        puts ''
      end
    end
  end

  def list_all_authors
    items = @games + @books + @music_albums
    if items.empty?
      puts 'There are not created Authors yet'
    else
      authors = create_authors_list(items)
      authors.each do |author|
        print "[Author]: '#{author}'"
        puts ''
      end
    end
  end

  def create_authors_list(items)
    authors = []
    items.each do |item|
      author_full = item.author.first_name + ' ' + item.author.last_name
      unless authors.include?(author_full)
        authors << author_full
      end
    end
    authors
  end
end
