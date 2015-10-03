require 'collector'

RSpec.describe Collector do

  it 'recognizes first useful cards' do
    collector = Collector.new

    useful_card   = Card.new "1S"
    useless_card  = Card.new "2B"

    expect(collector.is_useful? useful_card).to  be true
    expect(collector.is_useful? useless_card).to be false
  end

end
