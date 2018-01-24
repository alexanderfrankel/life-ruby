require './app/models/cell'

describe Cell do

  subject do
    Cell.new(1, 1)
  end

  describe '#initialize' do
    it 'is dead' do
      expect(subject.alive?).to equal(false)
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
