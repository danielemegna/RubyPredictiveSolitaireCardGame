class Verdict

  attr_reader :deck_snapshot
  attr_reader :flips_count
  attr_reader :rounds_count
  attr_reader :cards_count
  
  def initialize deck
    @is_victory     = deck.empty?
    @flips_count    = deck.flips_count
    @rounds_count   = deck.rounds_count
    @deck_snapshot  = deck.to_s
    @cards_count    = deck.size
  end

  def victory?
    @is_victory
  end

  def to_s
    "Verdict\n" +
    "-----------\n" +
    "- Victory?\t\t" + (if victory? then 'Yes' else 'No' end) + "\n" +
    "- Flips count:\t\t" + @flips_count.to_s + "\n" +
    "- Rounds count:\t\t" + @rounds_count.to_s + "\n" +
    "- Cards count:\t\t" + @cards_count.to_s + "\n" +
    "- Deck Snapshot:\t" + @deck_snapshot

  end

end
