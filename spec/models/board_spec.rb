require './app/models/board'

describe Board do

  let!(:seed) {
    [
      [1, 3],
      [7, 7],
      [12, 10],
      [5, 2],
      [10, 15]
    ]
  }

  subject do
    Board.new(seed)
  end

  describe'#initialize' do
    it 'has the same number of rows as the highest seed row' do
      expect(subject.rows.length).to equal(12)
    end

    it 'has the same number of cols as the highest seed col' do
      subject.rows.each do |row|
        expect(row.length).to equal(15)
      end
    end
  end

  describe '#get_cell' do
    context 'row is less than 0' do
      it 'returns nil' do
        expect(subject.get_cell(-1, 0)).to be_nil
      end
    end

    context 'col is less than 0' do
      it 'returns nil' do
        expect(subject.get_cell(0, -1)).to be_nil
      end
    end

    context 'row does not exist' do
      it 'returns nil' do
        expect(subject.get_cell(1000, 0)).to be_nil
      end
    end

    context 'col does not exist' do
      it 'returns nil' do
        expect(subject.get_cell(0, 1000)).to be_nil
      end
    end

    context 'row and col exist' do
      it 'returns cell' do
        expect(subject.get_cell(0, 0)).to be_instance_of(Cell)
      end
    end
  end

end
