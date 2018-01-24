require './app/views/games_view'
require './app/models/game'

describe GamesView do
  let!(:seed) {
    [
      [0, 1],
      [1, 0],
      [2, 2],
    ]
  }
  let!(:game) { Game.new(seed) }

  describe '#render' do
    it 'renders correctly' do
      expect{GamesView.render(game)}.to output("- x \nx x \n").to_stdout
    end
  end
end
