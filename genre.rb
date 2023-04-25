require_relative 'item'
require_relative 'music_album'
class Genre
  attr_reader :name, :id
  def initialize(name)
    @id = Random.rand(0..1000)
    @name = name
    @items = []
  end
end