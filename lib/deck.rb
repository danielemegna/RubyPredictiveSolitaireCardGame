class Deck
  
  attr_reader :flips_count

  def initialize cards
    @cards = cards.split.map {
      |card| Card.new(card)
    }

    @current_valuable_card_index = 1
    @just_started_over = false
    @flips_count = 0
  end
  
  def size
    @cards.length
  end

  def just_started_over?
    @just_started_over
  end

  def show_current_valuable_card
    @cards[@current_valuable_card_index]
  end

  def remove_current_valuable_card
    @cards.delete_at @current_valuable_card_index
    @current_valuable_card_index -= 1

    if(@current_valuable_card_index < 0)
      @current_valuable_card_index = 1
    end
  end

  def flip_cards
    @flips_count += 1

    @current_valuable_card_index += 2
    @just_started_over = false

    if(@current_valuable_card_index == @cards.length)
      @current_valuable_card_index -= 1
      return
    end

    if(@current_valuable_card_index > @cards.length)
      @current_valuable_card_index = 1
      @just_started_over = true
    end
  end

  def to_s
    @cards.map {
      |card| card.to_s
    }.join(" ")
    
  end

  def empty?
    size == 0
  end

end
