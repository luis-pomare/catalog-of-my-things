require_relative 'item'

class Book < Item
  attr_reader :publisher, cover_state

  def initilize(publish_date, publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end
end
