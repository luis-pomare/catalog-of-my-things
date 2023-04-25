require 'date'

class Item
  attr_reader :publish_date, :author

  def initialize(publish_date)
    @publish_date = publish_date
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
end

i = Item.new('2020-2-10')
puts i.author.first_name
