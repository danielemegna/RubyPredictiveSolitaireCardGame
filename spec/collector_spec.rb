require 'collector'

RSpec.describe Collector do

  it 'recognizes first useful cards' do
    collector = Collector.new

    useful_card   = Card.new "1S"
    useless_card  = Card.new "2B"

    expect(collector.is_useful? useful_card).to  be true
    expect(collector.is_useful? useless_card).to be false
  end

  it 'collects useful cards and recognizes new useful cards' do
    collector = Collector.new

    collector.collect(Card.new "1B")
    collector.collect(Card.new "1D")
    collector.collect(Card.new "2B")

    expect(collector.is_useful? Card.new("3B")).to  be true
    expect(collector.is_useful? Card.new("2D")).to  be true
    expect(collector.is_useful? Card.new("3D")).to  be false
  end

end