require './item'
require './music_album'
require './genre'
require './save_json'
puts 'Welcome to Catalog of my things!'

def options
  puts ['', 'Please choose an option by entering a number:']
  puts ['1 - List all books', '2 - List all music albums']
  puts ['3 - List of games', '4 - List all genres', '5 - List all labels']
  puts ['6 - List all authors', '7 - List all sources', '8 - Add a book']
  puts ['9 - Add a music album', '10 - Add a game']
  puts ['11 - Exit']
end

def trigger(int)
  functions = {
    4 => :list_genres,
    8 => :add_item_book,
    9 => :add_item_genre
  }
  send(functions[int])
end

# --------------------anas599--------------------
def add_item_genre
  @genres2 ||= []
  print 'Add a genre: '
  new_g = gets.chomp
  print 'Add the name of the album for this genre: '
  album_name = gets.chomp
  print 'Is this album on spotify? (y/n): '
  on_spotify = gets.chomp
  on_spotify = on_spotify == 'y'

  new_genre = Genre.new(new_g, album_name, on_spotify)
  @genres2 << new_genre

  puts "#{new_genre.name} (#{new_genre.album_name}) added to genres"
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

# --------------------anas599--------------------
def main
  options
  option = gets.chomp.to_i
  valid_options = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  if valid_options.include?(option)
    if option == 11
      puts 'Thanks for using this app'
    else
      trigger(option)
      main
    end
  else
    puts ['Error, choose one of the options', '']
    main
  end
end

main
