require 'rspec'
require '../music_albums'
require '../items'

describe MusicAlbum do
  let(:music_album) { MusicAlbum.new(true, Date.new(2000, 12, 12)) }

  describe '#initialize' do
    it 'should create a new music album' do
      expect(music_album).to be_an_instance_of MusicAlbum
    end
  end

  describe '#can_be_archived?' do
    it 'should return true if the album is not on spotify' do
      expect(music_album.can_be_archived?).to eq true
    end

    it 'should return false if the album is on spotify' do
      allow(music_album).to receive(:on_spotify?).and_return(true)
      expect(music_album.can_be_archived?).to eq false
    end
  end
end
