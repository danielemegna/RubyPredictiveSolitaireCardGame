class Verdict

  attr_reader :deck_snapshot
  
  def initialize is_victory, deck_snapshot
    @is_victory = is_victory
    @deck_snapshot = deck_snapshot
  end

  def victory?
    @is_victory
  end

end
