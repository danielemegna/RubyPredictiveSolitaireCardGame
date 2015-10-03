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
    latest_seed_card = @latest_useful_cards[card.seed]

    if(latest_seed_card == nil)
      return card.number == 1
    end

    return latest_seed_card.is_natural_successor? card
  end

  def collect card
    @latest_useful_cards[card.seed] = card
  end

end
