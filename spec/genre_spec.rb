require 'spec_helper'

describe Genre do
  before :each do
    @genre = Genre.new('Nelson')
    @mock_item = Item.new('2020-05-10')
  end

  describe '#add_item' do
    context 'This is a method from Author class to atatch an item to items array' do
      it 'Add and item to items array expect items.legnth plus one (from 0 to 1)' do
        @genre.add_item(@mock_item)
        expect(@genre.instance_variable_get(:@items).length).to eq(1)
      end
      it 'Add and author to add an instances of Author in @mock_item[@author]' do
        @genre.add_item(@mock_item)
        expect(@mock_item.genre).to be_an_instance_of(Genre)
      end
    end
  end
end
