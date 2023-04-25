class Author
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @id = rand(0..1000)
    @first_name = first_name
    @last_name = last_name
    @item = []
  end

  def add_item(item)
    @item << item
  end
end