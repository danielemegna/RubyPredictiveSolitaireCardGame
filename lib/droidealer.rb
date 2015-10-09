require 'verdict'

class Droidealer

  def generate_game_verdict deck_string
    Verdict.new false, deck_string
  end

end
