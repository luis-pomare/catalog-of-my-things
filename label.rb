class Label
  attr_reader :title, :color

  def initialize (title, color)
    @id = Random.rand(0..1000)
    @items = []
    @title = title
    @color = color
  end
end
