require 'card'

class Deck
  
  attr_reader :flips_count
  attr_reader :rounds_count

  def initialize cards
    @cards = cards.split.map {
      |card| Card.new(card)
    }

    @current_valuable_card_index = nil
    @just_finished = false
    @flips_count = 0
    @rounds_count = 0
  end
  
  def size
    @cards.length
  end

  def just_finished?
    @just_finished
  end

  def show_current_valuable_card
    return nil if @current_valuable_card_index == nil
    @cards[@current_valuable_card_index]
  end

  def remove_current_valuable_card
    @cards.delete_at @current_valuable_card_index
    @current_valuable_card_index -= 1

    if(@current_valuable_card_index < 0 && !empty?)
      flip_cards
    end
  end

  def flip_cards
    @flips_count += 1

    if @current_valuable_card_index == nil
      @current_valuable_card_index = 1
      return
    end

    @current_valuable_card_index += 2
    @just_finished = false


    if(@current_valuable_card_index == @cards.length)
      @current_valuable_card_index -= 1
      @just_finished = true
      return
    end

    if(@current_valuable_card_index == @cards.length-1)
      @just_finished = true
    end

    if(@current_valuable_card_index > @cards.length)
      @current_valuable_card_index = 1
      @rounds_count += 1
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
