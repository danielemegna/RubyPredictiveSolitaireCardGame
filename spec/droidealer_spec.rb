require 'droidealer'

RSpec.describe Droidealer do

  before(:each) do
    @droid = Droidealer.new
  end

  it 'recognizes simple fail games' do
    deck_string = "9S 5C 6C 10B 6B 6D 8C 10C 1S 2S 6S 5D " + 
      "9D 10S 2D 4B 4C 4D 7D 2C 1C 8B 1B 5S 3D " + 
      "2B 8S 3B 7B 7C 3S 8D 4S 7S 1D 10D 9C 9B 5B 3C"

    verdict = @droid.generate_game_verdict(deck_string)
    
    expect(verdict.victory?).to be false
    expect(verdict.cards_count).to eq 40
    expect(verdict.rounds_count).to eq 1
    expect(verdict.flips_count).to eq 20
    expect(verdict.deck_snapshot).to eq deck_string
  end

  it 'failure at the second rounds' do
    deck_string       = "9S 5C 6C 10B 6B 6D 8C 10C 2S 1S 6S 5D " + 
      "9D 10S 2D 4B 4C 4D 7D 2C 1C 8B 1B 5S 3D " + 
      "2B 8S 3B 7B 7C 3S 8D 4S 7S 1D 10D 9C 9B 5B 3C"

    expected_snapshot = "9S 5C 6C 10B 6B 6D 8C 10C 6S 5D " + 
      "9D 10S 2D 4B 4C 4D 7D 2C 1C 8B 1B 5S 3D " + 
      "2B 8S 3B 7B 7C 3S 8D 4S 7S 1D 10D 9C 9B 5B 3C"

    verdict = @droid.generate_game_verdict(deck_string)
    
    expect(verdict.victory?).to be false
    expect(verdict.cards_count).to eq 38
    expect(verdict.rounds_count).to eq 2
    expect(verdict.flips_count).to eq 20 + 19
    expect(verdict.deck_snapshot).to eq expected_snapshot
  end

  it 'win with trivial victory' do
    deck_string = "2C 1C 2B 1B 2D 1D 2S 1S 4C 3C 4B 3B " + 
      "4D 3D 4S 3S 6C 5C 6B 5B 6D 5D 6S 5S 8C " + 
      "7C 8B 7B 8D 7D 8S 7S 10C 9C 10B 9B 10D 9D 10S 9S"
      
    verdict = @droid.generate_game_verdict(deck_string)

    expect(verdict.victory?).to be true
    expect(verdict.cards_count).to eq 0
    expect(verdict.rounds_count).to eq 1
    expect(verdict.flips_count).to eq 20
    expect(verdict.deck_snapshot).to eq ""
  end

  it 'resolve a random new test case' do
    deck_string = "9S 7B 10S 6D AS 2D 8S 3C 5B 4S " + 
      "3B AB 4C 2B 10B 9B 9D 7D 7C 5D " +
      "8C 5S 4D 6C 9C 2S 7S 10D 3D 6S " +
      "10C AC 8B 8D AD 2C 6B 5C 4B 3S"
      
    verdict = @droid.generate_game_verdict(deck_string)

    expect(verdict.victory?).to be false
    expect(verdict.rounds_count).to eq 7
    expect(verdict.flips_count).to eq 87
    expect(verdict.cards_count).to eq 12
    expect(verdict.deck_snapshot).to eq "9S 10S 6D 8S 9D 7D 8C 9C 7S 10D 10C 8D"
    
  end

  it 'fix this loop game!!!!' do
    deck_string =
      "8S 5S 7C 1B 1D 7S 8D 10B 4D 8C " +
      "7D 6B 4C 8B 6S 2D 4S 2B 9D 9S " +
      "5C 1S 5D 3B 3D 9B 4B 9C 7B 10S " +
      "10C 5B 1C 10D 6D 6C 2C 3S 3C 2S"

    verdict = @droid.generate_game_verdict(deck_string)
  end

  it 'real verified game return wrong round count' do
    deck_string =
      "10D 4D 2C 2S 1S 2D 7C 6B 9C 6D " +
      "8C 9D 6C 3D 4C 2B 5D 3C 7D 5C " +
      "3S 10S 9S 6S 4B 1B 8D 7S 8B 1D " +
      "1C 10C 10B 5S 8S 7B 9B 5B 4S 3B"

    verdict = @droid.generate_game_verdict(deck_string)
    expect(verdict.victory?).to be true
    expect(verdict.flips_count).to eq 87
    expect(verdict.rounds_count).to eq 7

  end

end
