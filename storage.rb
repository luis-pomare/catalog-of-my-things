require 'json'

class Storage
  def initialize(relative_path)
    @relative_path = relative_path
  end

  def retrieve_games
    @storage.read('./storage/games.json').each do |obj|
      title = obj['title']
      author = obj['author']
      create_book(title, author)
    end
  end

  def retrieve_books
    @storage.read('books.json').each do |obj|
      title = obj['title']
      author = obj['author']
      create_book(title, author)
    end
  end

  def retrieve_rentals
    @storage.read('rentals.json').each do |obj|
      date = obj['date']
      book_title = obj['book_title']
      person_id = obj['person_id']
      create_rental(date, get_book(book_title), get_person(person_id))
    end
  end

  def retrieve_data
    retrieve_persons
    retrieve_books
    retrieve_rentals
  end

def create_file(array, name)
    array_hash = []
    array.each do |item|
      array_hash << item_to_json(item)
    end
    json = array_hash.to_json
    File.write("./#{@relative_path}/#{name}", json)
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
