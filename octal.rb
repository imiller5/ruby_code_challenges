require 'pry'

class Octal
  VALID_INTEGERS = [0, 1, 2, 3, 4, 5, 6, 7]
  OCTAL = 8

  attr_reader :string

  def initialize(string)
    @string = string
  end

  def to_decimal
    result = []
    return 0 if valid? == false
    string.to_i.digits.each_with_index do |num, idx|
      result << num * (OCTAL ** idx)
    end
    result.sum
  end

  def valid?
    result = true
    string.each_char do |char|
      result = false if VALID_INTEGERS.include?(char.to_i) == false ||
                        char != char.to_i.to_s
    end
    result
  end
end

num = Octal.new('7777')
p num.to_decimal