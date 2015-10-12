class Collector

  def initialize
    @latest_useful_cards = {
      "S" => nil,
      "B" => nil,
      "C" => nil,
      "D" => nil,
    }
  end

  def is_useful? card
    return false unless card

    latest_useful_card_by_seed = @latest_useful_cards[card.seed]

    # TODO this should be handled using a "fake Card" that
    # returns true when is_natural_successor is called 
    # with a 1 card of the same seed
    return card.number == 1 unless latest_useful_card_by_seed

    latest_useful_card_by_seed.is_natural_successor? card
  end

  def collect card
    raise UselessCollectAttempt,
      "Collector cannot collect #{card} card yet" unless is_useful? card

    @latest_useful_cards[card.seed] = card
  end

end

class UselessCollectAttempt < StandardError
end
