require 'date'

class Item
  attr_reader :publish_date

  def initialize(publish_date)
    @publish_date = publish_date
    @id = Random.rand(0..1000)
    @archived = false
  end

  def can_be_archived?
    now = Date.today
    before = Date.civil(publish_date)
    difference = (now - before).to_i
    difference_year = difference / 365
    return true if difference_year > 10

    false
  end

  def move_to_archive()
    @archived = can_be_archived?
  end
end
