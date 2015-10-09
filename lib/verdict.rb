class Verdict

  attr_reader :deck_snapshot
  attr_reader :filps_count
  
  def initialize is_victory, filps_count, deck_snapshot
    @is_victory = is_victory
    @filps_count = filps_count
    @deck_snapshot = deck_snapshot
  end

  def victory?
    @is_victory
  end

end
