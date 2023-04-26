def add_item_music()
  on_spotify = input_getter('Is this album on Spotify? [Y/N]: ')
  return add_item_music if on_spotify.capitalize != 'Y' && on_spotify.capitalize != 'N'

  on_spotify_boolean = on_spotify.capitalize == 'Y'
  puts 'published date (yyyy-mm-dd): '
  publish_date = gets.chomp
  data = MusicAlbum.new(on_spotify_boolean, Date.new(publish_date.to_i))
  music_albums = []
  if File.exist?('music_albums.json')
    File.open('music_albums.json', 'r') do |f|
      # rubocop:disable Security/JSONLoad
      music_albums = JSON.load(f)
      # rubocop:enable Security/JSONLoad
    end
    music_albums = [] unless music_albums.is_a?(Array)
  end

  music_albums << data.to_h
  File.write('music_albums.json', JSON.generate(music_albums), mode: 'w')
end

def display_genre
  music_albums = []
  if File.exist?('music_albums.json')
    File.open('music_albums.json', 'r') do |f|
      # rubocop:disable Security/JSONLoad
      music_albums = JSON.load(f)
      # rubocop:enable Security/JSONLoad
    end
    music_albums = [] unless music_albums.is_a?(Array)
  end
  music_albums.each do |music_album|
    puts "author: #{music_album['author']} genre: #{music_album['genre']}"
  end
end

def display_albums
  music_albums = []
  if File.exist?('music_albums.json')
    File.open('music_albums.json', 'r') do |f|
      # rubocop:disable Security/JSONLoad
      music_albums = JSON.load(f)
      # rubocop:enable Security/JSONLoad
    end
    music_albums = [] unless music_albums.is_a?(Array)
  end
  music_albums.each do |music_album|
    puts "label: #{music_album['label']} on spotify: #{music_album['on_spotify']}"
  end
end
