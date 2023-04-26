require 'date'

class Item
  attr_reader :publish_date
  attr_accessor :author, :label, :genre

  def initialize(publish_date)
    @publish_date = publish_date
    @id = Random.rand(0..1000)
    @archived = false
    @author = nil
    @genre = nil
    @label = nil
  end

  def can_be_archived?
    now = Date.today
    before = Date.parse(publish_date.to_s)
    difference = (now - before).to_i
    difference_year = difference / 365
    difference_year < 10
  end

  def move_to_archive()
    @archived = can_be_archived?
  end

  def add_author(first_name, last_name)
    author = Author.new(first_name, last_name)
    author.add_item(self)
  end

  def add_genre(genre)
    new_genre = Genre.new(genre)
    new_genre.add_item(self)
  end

  def add_label(label_name, label_color)
    label = Label.new(label_name, label_color)
    label.add_item(self)
  end
end
