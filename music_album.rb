require_relative 'item'
require_relative 'genre'
class MusicAlbum < Item
  def initialize(genre,publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify

  end

  def can_be_archived?
    super && @on_spotify
  end
end

mm = MusicAlbum.new('rock',Date.new(2020, 12, 12), true)
p mm
