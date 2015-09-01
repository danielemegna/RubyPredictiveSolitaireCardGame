class Card

  attr_reader :seed
  attr_reader :number

  def initialize number_and_seed
    @number = number_and_seed.slice(0, 1).to_i
    @seed   = number_and_seed.slice(1)
  end

  def has_same_seed? other_card
    @seed == other_card.seed
  end

  def is_natural_successor? other_card
    has_same_seed?(other_card) && @number == other_card.number-1
  end

end
