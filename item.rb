require 'date'
require_relative 'genre'

class Item
  attr_reader :publish_date, :label

  def initialize(publish_date)
    @publish_date = publish_date
    @genre = nil
    @id = Random.rand(0..1000)
    @archived = false
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

  def add_genre(new_genre)
    @genre = Genre.new(new_genre)
  end

  def label=(label)
    @label = label
    return unless label.items.include?(self) == false

    label.add_item(self)
  end
end

# nn = Item.new(Date.new(2020, 12, 12))
# p nn.can_be_archived?
gen = Item.new(Date.new(2020, 12, 12))
gen.add_genre('rock')
p gen
