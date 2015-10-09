require 'verdict'

class Droidealer

  def generate_game_verdict deck_string
    deck = Deck.new deck_string
    collector = Collector.new

    a_card_has_been_removed_in_this_round = false


    while true do

      while(collector.is_useful? deck.show_current_valuable_card) do
        collector.collect deck.show_current_valuable_card
        deck.remove_current_valuable_card
        a_card_has_been_removed_in_this_round = true

        if(deck.size == 0)
          break
        end
      end


      deck.flip_cards

      if(deck.just_started_over?)
        if(!a_card_has_been_removed_in_this_round)
          break
        end

        a_card_has_been_removed_in_this_round = false
      end

    end

    Verdict.new deck

  end

end
