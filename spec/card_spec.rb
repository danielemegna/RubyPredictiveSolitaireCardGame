require 'card'

RSpec.describe Card do

  it "inits itself with number and seed" do
    card = Card.new "10D"

    expect(card.number).to eq 10
    expect(card.seed).to eq "D"
  end

  it "recognize cards of the same seed" do
    three_of_coppe  = Card.new "3C"
    eight_of_coppe  = Card.new "8C"
    four_of_spade   = Card.new "4S"

    three_of_coppe.has_same_seed?(eight_of_coppe).should  be_true
    three_of_coppe.has_same_seed?(four_of_spade).should   be_false
    four_of_spade.has_same_seed?(eight_of_coppe).should   be_false
  end

  it "recognize natural successor" do
    two_of_coppe    = Card.new "2C"
    three_of_coppe  = Card.new "3C"
    eight_of_denari = Card.new "8D"
    nine_of_coppe   = Card.new "9C"

    two_of_coppe.is_natural_successor?(three_of_coppe).should   be_true
    two_of_coppe.is_natural_successor?(eight_of_denari).should  be_false
    three_of_coppe.is_natural_successor?(nine_of_coppe).should  be_false
    eight_of_denari.is_natural_successor?(nine_of_coppe).should be_false
  end

  it "supports equality" do
    card          = Card.new "2C"
    same_card     = Card.new "2C"
    another_card  = Card.new "5C"

    expect(card).to eq same_card
    expect(card).not_to eq another_card
  end

end
