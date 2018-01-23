require './board'

describe Board do

  context 'height and width not provided' do
    it 'raises an error' do
      expect{Board.new}.to raise_error(ArgumentError)
    end
  end

  context 'height and width provided' do
    subject do
      Board.new(height: 20, width: 20)
    end

    it 'has the correct number of rows' do
      expect(subject.rows.length).to equal(20)
    end

    it 'has the correct number of colums' do
      subject.rows.each do |row|
        expect(row.length).to equal(20)
      end
    end
  end

end
