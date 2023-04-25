class Genre
  attr_accessor :name

  def initialize(name)
    @id = Random.rand(0..1000)
    @name = name
    @items = []
  end
end
