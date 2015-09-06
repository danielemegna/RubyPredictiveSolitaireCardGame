require 'deck'

RSpec.describe Deck do

  before(:each) do
    @deck = Deck.new "9S 5C 6C 10B 6B 6D 8C 10C 2S 1S 6S 5D " + 
      "9D 10S 2D 4B 4C 4D 7D 2C 1C 8B 1B 5S 3D " + 
      "2B 8S 3B 7B 7C 3S 8D 4S 7S 1D 10D 9C 9B 5B 3C"
  end

  it "init with cards identifiers and get size" do
    expect(@deck.size).to eq 40
  end

  it "returns the current valuable card" do
    expected = Card.new "5C"
    expect(@deck.get_current_valuable_card).to eq expected
  end

  it "change valuable card after flip" do
    @deck.flip_cards
    expected = Card.new "10B"
    expect(@deck.get_current_valuable_card).to eq expected
  end

  it "reload from begin after 20 filp" do
    20.times { @deck.flip_cards }
    expected = Card.new "5C"
    expect(@deck.get_current_valuable_card).to eq expected
  end

end
