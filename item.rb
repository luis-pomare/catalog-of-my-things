require 'date'

class Item
  attr_reader :publish_date, :author, :label

  def initialize(publish_date)
    @publish_date = publish_date
    @genre = nil
    @id = Random.rand(0..1000)
    @archived = false
    @author = add_author
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
    print 'Insert first name: '
    first_name = gets.chomp
    print 'Insert last name: '
    last_name = gets.chomp
    Author.new(first_name, last_name)
  end

  def label=(label)
    @label = label
    return unless label.items.include?(self) == false

    label.add_item(self)
  end
end
