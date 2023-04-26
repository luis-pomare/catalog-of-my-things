class Genre
  attr_accessor :name, :items

  def initialize(name)
    @id = Random.rand(0..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item if @items.include?(item) == false
    item.genre = self
  end
end
