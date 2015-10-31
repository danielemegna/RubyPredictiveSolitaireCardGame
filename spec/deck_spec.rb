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

  it "has zero flips at beginning" do
    expect(@deck.flips_count).to eq 0
  end

  it "has zero rounds at beginning" do
    expect(@deck.rounds_count).to eq 0
  end

  it "is not just_finished at the beginning" do
    expect(@deck.just_finished?).to be false
  end

  it "shows nil at the beginnig" do
    expect(@deck.show_current_valuable_card).to be_nil
  end

  it "shows the current valuable card after a flip" do
    @deck.flip_cards
    expected = Card.new "5C"
    expect(@deck.show_current_valuable_card).to eq expected
  end

  it "changes valuable card after flip" do
    2.times { @deck.flip_cards }
    expected = Card.new "10B"
    expect(@deck.show_current_valuable_card).to eq expected
  end

  it "shows last card after 20 flip" do
    20.times { @deck.flip_cards }
    expected = Card.new "3C"
    expect(@deck.show_current_valuable_card).to eq expected
  end

  it "has 1 round after 21 flips" do
    21.times { @deck.flip_cards }
    expect(@deck.rounds_count).to eq 1
  end

  it "recognizes end of deck as just_finished" do
    20.times { @deck.flip_cards }
    expect(@deck.just_finished?).to be true
  end

  it "can remove the current valuable card" do
    @deck.flip_cards
    @deck.remove_current_valuable_card

    expected_next_valuable_card = Card.new "9S"
    expected_deck_size = 39

    expect(@deck.show_current_valuable_card).to eq expected_next_valuable_card
    expect(@deck.size).to eq expected_deck_size
  end

  it "shows third card at the next round if there was a remove" do
    @deck.flip_cards
    @deck.remove_current_valuable_card
    20.times { @deck.flip_cards }
    
    expected = Card.new "6C"
    expect(@deck.show_current_valuable_card).to eq expected
  end

  it "shows also the last card at the next round when cards count is odd" do
    @deck.flip_cards
    @deck.remove_current_valuable_card
    39.times { @deck.flip_cards }
    
    expected = Card.new "3C"
    expect(@deck.show_current_valuable_card).to eq expected
  end

  it "returns third card as next valuable after two remove at the beginning" do
    @deck.flip_cards
    @deck.remove_current_valuable_card
    @deck.remove_current_valuable_card
    
    expected = Card.new "10B"
    expect(@deck.show_current_valuable_card).to eq expected
    expect(@deck.just_finished?).to be false
  end

  it "recognizes end of deck as just_finished also with 20 cards" do
    @deck.flip_cards
    20.times { @deck.remove_current_valuable_card }

    9.times { @deck.flip_cards }
    expect(@deck.just_finished?).to be true
  end

  it "can print itself as cards string" do
    expected = "9S 5C 6C 10B 6B 6D 8C 10C 2S 1S 6S 5D " + 
      "9D 10S 2D 4B 4C 4D 7D 2C 1C 8B 1B 5S 3D " + 
      "2B 8S 3B 7B 7C 3S 8D 4S 7S 1D 10D 9C 9B 5B 3C"

    expect(@deck.to_s).to eq expected
  end

  it "is empty after 40 removes" do
    expect(@deck.empty?).to be false

    @deck.flip_cards
    40.times { @deck.remove_current_valuable_card }

    expect(@deck.empty?).to be true
  end

  it "provides number of executed flips" do
    flips = 42 
    flips.times { @deck.flip_cards }

    expect(@deck.flips_count).to eq flips
  end

end
