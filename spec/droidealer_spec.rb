require 'droidealer'

RSpec.describe Droidealer do

  it 'recognizes simple fail games' do
    @droid = Droidealer.new

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

  it 'failure after two rounds' do
    @droid = Droidealer.new

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

  xit 'win with trivial victory' do
    @droid = Droidealer.new

    deck_string = "2C 1C 2B 1B 2D 1D 2S 1S 4C 3C 4B 3B " + 
      "4D 3D 4S 3S 6C 5C 6B 5B 6D 5D 6S 5S 8C " + 
      "7C 8B 7B 8D 7D 8S 7S 10C 9C 10B 9B 10D 9D 10S 9S"
      
    verdict = @droid.generate_game_verdict(deck_string)

    expect(verdict.victory?).to be true
    expect(verdict.cards_count).to eq 0
    expect(verdict.rounds_count).to eq 0
    expect(verdict.flips_count).to eq 0
    expect(verdict.deck_snapshot).to eq ""
  end

end
