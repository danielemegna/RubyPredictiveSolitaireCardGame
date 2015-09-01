require 'card'

RSpec.describe Card do

  it "inits itself with number and seed" do
    card = Card.new("4D")
    expect(card.number).to eq 4
    expect(card.seed).to eq "D"
  end

end
