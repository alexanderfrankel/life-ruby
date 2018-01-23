require './cell'

describe Cell do

  subject do
    Cell.new
  end

  it 'is dead initially' do
    expect(subject.live).to equal(false)
  end
end
