require 'date'

class Item
  attr_reader :publish_date, :author, :label, :genre

  def initialize(publish_date)
    @publish_date = publish_date
    @genre = nil
    @id = Random.rand(0..1000)
    @archived = false
    @author = add_author
    @genre = add_genre
    @label = add_label
  end

  def can_be_archived?
    now = Date.today
    before = Date.parse(publish_date.to_s)
    difference = (now - before).to_i
    difference_year = difference / 365
    difference_year >= 10
  end

  def move_to_archive()
    @archived = can_be_archived?
  end

  def add_author()
    print 'Insert author first name: '
    first_name = gets.chomp
    print 'Insert author last name: '
    last_name = gets.chomp
    Author.new(first_name, last_name)
  end

  def add_genre()
    print 'Enter Genre : '
    new_genre = gets.chomp
    Genre.new(new_genre)
  end

  def label=(label)
    @label = label
    return unless label.items.include?(self) == false

    label.add_item(self)
  end

  def add_label
    print 'Enter label name: '
    label_name = gets.chomp
    print 'Enter label color: '
    label_color = gets.chomp
    Label.new(label_name, label_color)
  end
end
