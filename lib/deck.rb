class Deck

  def initialize cards
    @cards = cards.split.map {
      |card| Card.new(card)
    }

    @current_valuable_card_index = 1
  end
  
  def size
    @cards.length
  end

  def get_current_valuable_card
    @cards[@current_valuable_card_index]
  end

end
