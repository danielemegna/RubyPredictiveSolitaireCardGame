require_relative 'verdict'
require_relative 'deck'
require_relative 'collector'

class Droidealer

  def generate_game_verdict deck_string
    deck = Deck.new deck_string
    collector = Collector.new

    a_card_has_been_removed_in_this_round = false

    while true do

      deck.flip_cards

      while(collector.is_useful? deck.show_current_valuable_card) do
        collector.collect deck.show_current_valuable_card
        deck.remove_current_valuable_card
        a_card_has_been_removed_in_this_round = true
      end

      if(deck.size == 0)
        break
      end

      if(deck.just_finished?)
        if(!a_card_has_been_removed_in_this_round)
          break
        end

        a_card_has_been_removed_in_this_round = false
      end

    end

    Verdict.new deck

  end

  def random_stats_as_string

    result = ""

    result += random_good_deck
    result += "\n"
    result += random_victory_stats(500)
  end

  def random_good_deck

    result = ""

    loop do
      deck_string = new_random_deck_string
      verdict = generate_game_verdict(deck_string)

      if verdict.victory?
        result += 'Playing with ' + deck_string + "\n"
        result += verdict.to_s + "\n"
        break
      end
    end

    result

  end

  def random_victory_stats(games_count)

    result = ""

    victory_count = 0
    min_flips_victory_count = 1000
    
    games_count.times {
      deck_string = new_random_deck_string
      verdict = generate_game_verdict(deck_string)
      if verdict.victory?
        victory_count += 1
        min_flips_victory_count = [verdict.flips_count, min_flips_victory_count].min
      end
    }

    result += victory_count.to_s + " victories on #{games_count} games" + "\n"
    result += "Victory rate: " + (victory_count.to_f / games_count.to_f * 100).to_s + "\n"
    result += "Minimum filps victory count: " + min_flips_victory_count.to_s + "\n"

    result

  end

  def new_random_deck_string
    deck_string = "2C 1C 2B 1B 2D 1D 2S 1S 4C 3C 4B 3B " + 
      "4D 3D 4S 3S 6C 5C 6B 5B 6D 5D 6S 5S 8C " + 
      "7C 8B 7B 8D 7D 8S 7S 10C 9C 10B 9B 10D 9D 10S 9S"

    cards_array = deck_string.split().shuffle
    cards_array.join(' ')
  end

end
