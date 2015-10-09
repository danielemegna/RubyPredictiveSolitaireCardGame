class Verdict

  attr_reader :deck_snapshot
  attr_reader :flips_count
  attr_reader :rounds_count
  
  def initialize deck
    @is_victory = deck.empty?
    @flips_count = deck.flips_count
    @rounds_count = deck.rounds_count
    @deck_snapshot = deck.to_s
  end

  def victory?
    @is_victory
  end

end
