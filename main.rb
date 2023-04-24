require './item'

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
    8 => :add_item_book
  }
  send(functions[int])
end

def add_item_book()
  print 'Add a date: '
  date = gets.chomp
end

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
