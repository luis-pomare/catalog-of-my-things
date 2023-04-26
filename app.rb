require './music_methods'
class App
  attr_accessor :games, :books, :labels, :authors, :genre, :music_albums

  def initialize()
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

  def add_item_game()
    multiplayer = input_getter('Is this game multiplayer? [Y/N]: ')
    return add_item_game if multiplayer.capitalize != 'Y' && multiplayer.capitalize != 'N'

    multiplayer_bool = multiplayer.capitalize == 'Y'

    print 'Last time played date (yyyy-mm-dd): '
    last_played_at = gets.chomp

    print 'Publucation date (yyyy-mm-dd): '
    publish_date = gets.chomp

    @games << Game.new(multiplayer_bool, last_played_at, Date.new(publish_date.to_i))
    @labels << @games.last.label
    @authors << @games.last.author
    @genre << @games.last.genre
    puts ['Game created succesfully', '']
  end

  def add_item_book()
    print 'Please enter the publisher: '
    publisher = gets.chomp

    print 'Describe the cover state of the book: '
    cover_state = gets.chomp

    print 'published date (yyyy-mm-dd): '
    publish_date = gets.chomp

    @books << Book.new(Date.new(publish_date.to_i), publisher, cover_state)
    @labels << @books.last.label
    @authors << @books.last.author
    @genre << @books.last.genre
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

  def create_file(array, name)
    array_hash = []
    array.each do |item|
      array_hash << item_to_json(item)
    end
    json = array_hash.to_json
    File.write("./storage/#{name}", json)
  end

  def item_to_json(item)
    json_obj = {}
    item.instance_variables.each do |var|
      json_obj[var.to_s.gsub('@', '')] = if item.instance_variable_get(var).instance_variables.empty?
                                           item.instance_variable_get(var)
                                         else
                                           item_to_json(item.instance_variable_get(var))
                                         end
    end
    json_obj
  end
end
