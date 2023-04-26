require 'spec_helper'
describe MusicAlbum do
  describe '#can_be_archived?' do
    context 'when album can be archived' do
      it 'returns false' do
        album = MusicAlbum.new(false, Date.today)
        expect(album.can_be_archived?).to be_falsey
      end
    end
  end
  describe '#move_to_archive' do
    context 'when album can be archived' do
      it 'returns true' do
        album = MusicAlbum.new(false, Date.today)
        expect(album.move_to_archive).to be_falsey
      end
    end
  end
  describe '#music album' do
    context 'when music album is created' do
      it 'create a new object' do
        album = MusicAlbum.new(false, Date.today)
        expect(album).to be_an_instance_of(MusicAlbum)
      end
    end
  end
end
