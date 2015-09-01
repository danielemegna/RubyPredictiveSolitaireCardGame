require 'card'

RSpec.describe Card do

  it "inits itself with number and seed" do
    card = Card.new "4D"
    expect(card.number).to eq 4
    expect(card.seed).to eq "D"
  end

  it "recognize cards of the same seed" do
    three_of_coppe  = Card.new "3C"
    eight_of_coppe  = Card.new "8C"
    four_of_spade   = Card.new "4S"

    three_of_coppe.has_same_seed?(eight_of_coppe).should be_true
    three_of_coppe.has_same_seed?(four_of_spade).should be_false
    four_of_spade.has_same_seed?(eight_of_coppe).should be_false
  end

end
