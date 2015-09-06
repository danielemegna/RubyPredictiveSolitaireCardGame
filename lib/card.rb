class Card

  attr_reader :seed
  attr_reader :number

  def initialize number_and_seed
    seed_index = number_and_seed.length-1
    @number = number_and_seed.slice(0, seed_index).to_i
    @seed   = number_and_seed.slice(seed_index)
  end

  def has_same_seed? other_card
    @seed == other_card.seed
  end

  def is_natural_successor? other_card
    has_same_seed?(other_card) && @number == other_card.number-1
  end

  def ==(other)
    @number == other.number && @seed == other.seed
  end

end
