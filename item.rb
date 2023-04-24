class Item
  attr_reader :publish_date
  def initialize (publish_date)
    @publish_date = publish_date
    @id = Random.rand(0..1000)
  end
end
