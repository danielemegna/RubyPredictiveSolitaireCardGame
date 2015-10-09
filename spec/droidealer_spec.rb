require 'droidealer'

RSpec.describe Droidealer do

  it 'recognizes simple fail games' do
    @droid = Droidealer.new

    deck_string = "9S 5C 6C 10B 6B 6D 8C 10C 1S 2S 6S 5D " + 
      "9D 10S 2D 4B 4C 4D 7D 2C 1C 8B 1B 5S 3D " + 
      "2B 8S 3B 7B 7C 3S 8D 4S 7S 1D 10D 9C 9B 5B 3C"

    verdict = @droid.generate_game_verdict(deck_string)
    
    expect(verdict.victory?).to be false
    expect(verdict.deck_snapshot).to eq deck_string
    expect(verdict.flips_count).to eq 20
  end

end
