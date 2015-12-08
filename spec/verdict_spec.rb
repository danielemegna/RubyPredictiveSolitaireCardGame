require 'droidealer'

RSpec.describe Droidealer do
  
  it 'prints himself formatted' do
    deck = Deck.new "9S 5C 6C 10B 6B 6D 8C 10C"
    verdict = Verdict.new deck

    expected =
      "Verdict\n" +
      "-----------\n" +
      "- Victory?\t\tNo\n" +
      "- Flips count:\t\t0\n" +
      "- Rounds count:\t\t1\n" +
      "- Cards count:\t\t8\n" +
      "- Deck Snapshot:\t9S 5C 6C 10B 6B 6D 8C 10C"

    expect(verdict.to_s).to eq expected
  end

  it 'prints himself after flips' do
    deck = Deck.new "9S 5C 6C 10B 6B 6D 8C 10C"
    9.times{ deck.flip_cards }

    verdict = Verdict.new deck

    expected =
      "Verdict\n" +
      "-----------\n" +
      "- Victory?\t\tNo\n" +
      "- Flips count:\t\t9\n" +
      "- Rounds count:\t\t3\n" +
      "- Cards count:\t\t8\n" +
      "- Deck Snapshot:\t9S 5C 6C 10B 6B 6D 8C 10C"

    expect(verdict.to_s).to eq expected
  end

  it 'prints himself after remove' do
    deck = Deck.new "9S 5C 6C 10B 6B 6D 8C 10C"
    deck.flip_cards
    4.times{ deck.remove_current_valuable_card }

    verdict = Verdict.new deck

    expected =
      "Verdict\n" +
      "-----------\n" +
      "- Victory?\t\tNo\n" +
      "- Flips count:\t\t3\n" +
      "- Rounds count:\t\t1\n" +
      "- Cards count:\t\t4\n" +
      "- Deck Snapshot:\t6B 6D 8C 10C"

    expect(verdict.to_s).to eq expected
  end

end
