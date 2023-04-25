require_relative 'item'

class Book < Item
  def initilize(publish_date, publisher, cover_state )
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end
end
