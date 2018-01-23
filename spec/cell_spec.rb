require './cell'

describe Cell do

  subject do
    Cell.new
  end

  describe '#initialize' do
    it 'is dead' do
      expect(subject.live).to equal(false)
    end
  end

  describe '#alive!' do
    before do
      subject.alive!
    end

    it 'is alive' do
      expect(subject.live).to equal(true)
    end
  end

end
