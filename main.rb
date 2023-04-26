require './game'
require './author'
require './app'
require './item'
require './music_album'
require './genre'
require 'date'
require './book'
require './label'
require 'pry'

puts 'Welcome to Catalog of my things!'

def options
  puts ['', 'Please choose an option by entering a number:']
  puts ['1 - List all books', '2 - List all music albums']
  puts ['3 - List of games', '4 - List all genres', '5 - List all labels']
  puts ['6 - List all authors', '7 - Add a book']
  puts ['8 - Add a music album', '9 - Add a game']
  puts ['10 - Exit']
end

def main
  @app = App.new if @app.nil?
  options
  option = gets.chomp.to_i
  valid_options = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  if valid_options.include?(option)
    if option == 10
      puts 'Thanks for using this app'
    else
      @app.trigger(option)
      binding.pry
      main
    end
  else
    puts ['Error, choose one of the options', '']
    main
  end
end

main
