class ArgumentError < StandardError; end

class Series
  attr_reader :num_string

  def initialize(num_string)
    @num_string = num_string
  end

  def slices(length)
    raise ArgumentError.new, 'Argument Error' if length > num_string.size
    num_string.chars.map(&:to_i).each_cons(length).to_a
  end
end
