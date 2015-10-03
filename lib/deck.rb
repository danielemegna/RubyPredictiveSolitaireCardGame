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

  def show_current_valuable_card
    @cards[@current_valuable_card_index]
  end

  def remove_current_valuable_card
    @cards.delete_at @current_valuable_card_index
    @current_valuable_card_index -= 1
  end

  def flip_cards
    @current_valuable_card_index += 2

    if(@current_valuable_card_index > @cards.length)
      @current_valuable_card_index = 1
    end

    if(@current_valuable_card_index == @cards.length)
      @current_valuable_card_index -= 1
    end
  end

end
