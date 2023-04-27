require 'spec_helper'

describe Game do
  describe '#can_be_archived?' do
    context 'It evaluated if a published_game_date is longer than 10 years from today' do
      it 'Takes a Game instances and return true or false expected (true)' do
        @game = Game.new(true, '2022-08-07', '2020-05-10')
        expect(@game.can_be_archived?).to eql(true)
      end
      it 'Takes a Game instances and return true or false expected (false)' do
        @game = Game.new(false, '2000-08-07', '1990-05-10')
        expect(@game.can_be_archived?).to eql(false)
      end
    end
  end
end
