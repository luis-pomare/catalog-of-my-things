require './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    super(publish_date)
  end

  def can_be_archived?
    # define date format
    super.can_be_archived? && true
  end
end
