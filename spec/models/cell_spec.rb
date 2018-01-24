require './app/models/cell'

describe Cell do

  subject do
    Cell.new([1, 1])
  end

  describe '#initialize' do
    context 'default' do
      it 'is dead by default' do
        expect(subject.alive?).to equal(false)
      end
    end

    context 'live cell' do
      subject do
        Cell.new([1, 1], true)
      end

      it 'is alive' do
        expect(subject.alive?).to equal(true)
      end
    end

    context 'invalid coordinates' do
      subject do
        Cell.new([-1, 1])
      end

      it 'raises an error' do
        expect{subject}.to raise_error(ArgumentError)
      end
    end

    context 'coordinates are incomplete' do
      subject do
        Cell.new([1])
      end

      it 'raises an error' do
        expect{subject}.to raise_error(ArgumentError)
      end
    end

    context 'coordinates do not exist' do
      subject do
        Cell.new([])
      end

      it 'raises an error' do
        expect{subject}.to raise_error(ArgumentError)
      end
    end
  end

  describe '#row_index' do
    it 'is correct value' do
      expect(subject.row_index).to equal(1)
    end
  end

  describe '#col_index' do
    it 'is correct value' do
      expect(subject.col_index).to equal(1)
    end
  end

  describe '#alive?' do
    context 'alive' do
      before do
        subject.alive!
      end

      it 'returns true' do
        expect(subject.alive?).to equal(true)
      end
    end

    context 'dead' do
      before do
        subject.dead!
      end

      it 'returns false' do
        expect(subject.alive?).to equal(false)
      end
    end
  end

  describe '#alive!' do
    before do
      subject.alive!
    end

    it 'is alive' do
      expect(subject.alive?).to equal(true)
    end
  end

  describe '#dead!' do
    before do
      subject.dead!
    end

    it 'is dead' do
      expect(subject.alive?).to equal(false)
    end
  end

end
