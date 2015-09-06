class Deck

  def initialize cards
    @cards = cards.split.map {
      |card| Card.new(card)
    }
  end
  
  def size
    @cards.length
  end

  def get_current_valuable_card
    @cards[1]
  end

end
