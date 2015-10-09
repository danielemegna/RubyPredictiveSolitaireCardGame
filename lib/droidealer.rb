require 'verdict'

class Droidealer

  def generate_game_verdict deck_string
    Verdict.new false, 20, deck_string
  end

end
