class MusicAlbum < Item
  def initialize(on_spotify, publish_date)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_h
    {
      id: @id,
      label: @label.title,
      author: @author.first_name,
      genre: @genre.name,
      on_spotify: @on_spotify,
      publish_date: @publish_date.to_s
    }
  end
end
