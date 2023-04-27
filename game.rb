require './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    super(publish_date)
  end

  def can_be_archived?
    now = Date.today
    before = Date.parse(last_played_at.to_s)
    difference = (now - before).to_i
    difference_year = difference / 365
    last_played = difference_year < 2
    puts super
    super && last_played
  end
end
