require 'deck'

RSpec.describe Deck do

  before(:each) do
    @deck = Deck.new "9S 5C 6C 10B 6B 6D 8C 10C 2S 1S 6S 5D " + 
      "9D 10S 2D 4B 4C 4D 7D 2C 1C 8B 1B 5S 3D " + 
      "2B 8S 3B 7B 7C 3S 8D 4S 7S 1D 10D 9C 9B 5B 3C"
  end

  it "provides its size" do
    expect(@deck.size).to eq 40
  end

  it "shows the current valuable card" do
    expected = Card.new "5C"
    expect(@deck.show_current_valuable_card).to eq expected
  end

  it "changes valuable card after flip" do
    @deck.flip_cards
    expected = Card.new "10B"
    expect(@deck.show_current_valuable_card).to eq expected
  end

  it "reloads from begin after 20 filp" do
    20.times { @deck.flip_cards }
    expected = Card.new "5C"
    expect(@deck.show_current_valuable_card).to eq expected
  end

  it "can remove the current valuable card" do
    @deck.remove_current_valuable_card

    expected_next_valuable_card = Card.new "9S"
    expected_deck_size = 39

    expect(@deck.show_current_valuable_card).to eq expected_next_valuable_card
    expect(@deck.size).to eq expected_deck_size
  end

  it "shows third card at the next round if there was a remove" do
    @deck.remove_current_valuable_card
    20.times { @deck.flip_cards }
    
    expected = Card.new "6C"
    expect(@deck.show_current_valuable_card).to eq expected
  end

  it "shows also the last card at the next round when cards count is odd" do
    @deck.remove_current_valuable_card
    39.times { @deck.flip_cards }
    
    expected = Card.new "3C"
    expect(@deck.show_current_valuable_card).to eq expected
  end

  it "returns third card as next valuable after two remove at the beginning" do
    @deck.remove_current_valuable_card
    @deck.remove_current_valuable_card
    
    expected = Card.new "10B"
    expect(@deck.show_current_valuable_card).to eq expected
  end

  it "is evaluating top deck at the beginning" do
    expect(@deck.evaluating_top_deck?).to be true
  end

end
