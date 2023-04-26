require 'spec_helper'

describe Author do
  before :each do
    @author = Author.new('Nelson', 'Araujo')
    @mock_item = {
      id: 1,
      publish_date: '2020-5-5',
      author: {}
    }
  end

  describe '#add_item' do
    context 'This is a method from Author class to atatch an item to items array' do
      it 'Add and item to items array expect items.legnth plus one (from 0 to 1)' do
        @author.add_item(@mock_item)
        expect(@author.instance_variable_get(:@items).length).to eq(1)
      end
      it 'Add and author to add an instances of Author in @mock_item[@author]' do
        @author.add_item(@mock_item)
        expect(@mock_item[:author]).to be_an_instance_of(Author)
      end
    end
  end
end
