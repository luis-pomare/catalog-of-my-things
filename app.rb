require './music_methods'
class App
  attr_accessor :games, :books, :labels, :authors, :genre, :music_albums, :storage

  def initialize()
    @storage = Storage.new('storage')
    @music_albums = []
    @genre = []
    @games = []
    @books = []
    @labels = []
    @authors = []
    @functions = {
      1 => :list_all_books,
      2 => :display_albums,
      3 => :list_all_games,
      4 => :display_genre,
      5 => :list_all_labels,
      6 => :list_all_authors,
      7 => :add_item_book,
      8 => :add_item_music,
      9 => :add_item_game
    }
  end

  def trigger(int)
    send(@functions[int])
  end

  def input_getter(msj, is_number: false)
    print msj
    is_number ? gets.chomp.to_i : gets.chomp
  end

  def inputs(item)
    label = input_getter('Enter a label name: ')
    color = input_getter('Enter a label color: ')
    genre = input_getter('Enter a genre: ')
    first_name = input_getter('Author first_name: ')
    last_name = input_getter('Author last_name: ')
    item.add_author(first_name, last_name)
    item.add_genre(genre)
    item.add_label(label, color)
    @labels << item.label
    @authors << item.author
    @genre << item.genre
  end

  def add_item_game()
    multiplayer = input_getter('Is this game multiplayer? [Y/N]: ')
    return add_item_game if multiplayer.capitalize != 'Y' && multiplayer.capitalize != 'N'

    multiplayer_bool = multiplayer.capitalize == 'Y'
    last_played_at = input_getter('Last time played date (yyyy-mm-dd): ')
    publish_date = input_getter('Publucation date (yyyy-mm-dd): ')
    @games << Game.new(multiplayer_bool, last_played_at, Date.new(publish_date.to_i))
    inputs(@games.last)
    puts ['Game created succesfully', '']
  end

  def add_item_music()
    on_spotify = input_getter('Is this album on spotify? [Y/N]: ')
    return add_item_music if on_spotify.capitalize != 'Y' && on_spotify.capitalize != 'N'

    on_spotify_boolean = on_spotify.capitalize == 'Y'
    publish_date = input_getter('Publucation date (yyyy-mm-dd): ')
    @music_albums << MusicAlbum.new(on_spotify_boolean, Date.new(publish_date.to_i))
    inputs(@music_albums.last)
    puts ['Music Album created succesfully', '']
  end

  def add_item_book()
    publisher = input_getter('Please enter the publisher: ')
    cover_state = input_getter('Describe the cover state of the book: ')
    publish_date = input_getter('published date (yyyy-mm-dd): ')
    @books << Book.new(Date.new(publish_date.to_i), publisher, cover_state)
    inputs(@books.last)
    puts ['Book created succesfully', '']
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
    if @authors.empty?
      puts 'There are not authors created yet'
    else
      @authors.each do |author|
        print "[Author]: '#{author.first_name} #{author.last_name}'"
        puts ''
      end
    end
  end

  def list_all_books
    if @books.empty?
      puts 'There are not books created yet'
    else
      @books.each do |book|
        print "Title: '#{book.label.title}, Author: '#{book.author.first_name}'"
        puts ''
      end
    end
  end

  def list_all_labels
    if @labels.empty?
      puts 'There are not labels created yet'
    else
      @labels.each do |label|
        print "Title: '#{label.title}, Color: '#{label.color}'"
        puts ''
      end
    end
  end

  def list_all_genres
    if @genre.empty?
      puts 'There are not genres created yet'
    else
      @genre.each do |genre|
        print "Genre: '#{genre.name}'"
        puts ''
      end
    end
  end

  def list_all_album
    if @music_albums.empty?
      puts 'There are not albums created yet'
    else
      @music_albums.each do |album|
        print "Albums: '#{album.label.title}' Author: '#{album.author.first_name}'"
        puts ''
      end
    end
  end
end
