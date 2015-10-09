class Card

  attr_reader :seed
  attr_reader :number

  def initialize number_and_seed
    @seed   = extract_seed_from_string(number_and_seed)
    @number = extract_number_from_string(number_and_seed)
  end

  def has_same_seed? other_card
    @seed == other_card.seed
  end

  def is_natural_successor? other_card
    has_same_seed?(other_card) && @number == other_card.number-1
  end

  def ==(other)
    other != nil &&
    @number == other.number &&
    @seed == other.seed
  end

  def to_s
    "#{@number}#{@seed}"
  end

  private

    def extract_seed_from_string string
      seed_index = string.length - 1
      string
        .slice(seed_index)
    end

    def extract_number_from_string string
      seed_index = string.length - 1
      string
        .slice(0, seed_index) 
        .sub('A', '1')
        .to_i
    end

end
