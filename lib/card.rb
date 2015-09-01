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

end
