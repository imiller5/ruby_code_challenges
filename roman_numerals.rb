# Write some code that converts modern decimal numbers into their Roman number equivalents.

class RomanNumerals
  NUMBERS_TO_NUMERALS = {1 => 'I', 4 => 'IV', 5 => 'V', 9 => 'IX', 10 => 'X',
                       40 => 'XL', 50 => 'L', 90 => 'XC', 100 => 'C', 400 => 'CD',
                       500 => 'D', 900 => 'CM', 1000 => 'M'}
  attr_reader :digits, :digit_array, :roman_numeral

  def initialize(digits)
    @digits = digits
    @digit_array = @digits.digits.reverse
    @roman_numeral = []
  end 

  def to_roman
    result = ''
    num_of_digits = self.num_of_digits
    
    case num_of_digits
    when 1
      ones(digit_array[0])
    when 2
      tens(digit_array[0])
      ones(digit_array[1])
    when 3 
      hundreds(digit_array[0])
      tens(digit_array[1])
      ones(digit_array[2])
    when 4
      thousands(digit_array[0])
      hundreds(digit_array[1])
      tens(digit_array[2])
      ones(digit_array[3])
    end
    roman_numeral.join
  end

  def num_of_digits
    digit_array.size
  end

  def four_or_nine?(digit)
    digit == 4 || digit == 9
  end

  def ones(digit)
    case digit
    when 0
      ''
    when 1..3 
      roman_numeral << NUMBERS_TO_NUMERALS[1] * digit
    when 4
      roman_numeral << NUMBERS_TO_NUMERALS[4]
    when 5
      roman_numeral << NUMBERS_TO_NUMERALS[5]
    when 9 
      roman_numeral << NUMBERS_TO_NUMERALS[9]
    else 
      roman_numeral << NUMBERS_TO_NUMERALS[5] + NUMBERS_TO_NUMERALS[1] * (digit - 5)
    end
  end

  def tens(digit)
    case digit
    when 0 
      ''
    when 1..3
      roman_numeral << NUMBERS_TO_NUMERALS[10] * digit
    when 4
      roman_numeral << NUMBERS_TO_NUMERALS[40]
    when 5
      roman_numeral << NUMBERS_TO_NUMERALS[50]
    when 9 
      roman_numeral << NUMBERS_TO_NUMERALS[90]
    else
      roman_numeral << NUMBERS_TO_NUMERALS[50] + NUMBERS_TO_NUMERALS[10] * (digit - 5)
    end
  end

  def hundreds(digit)
    case digit
    when 0 
      ''
    when 1..3
      roman_numeral << NUMBERS_TO_NUMERALS[100] * digit
    when 4
      roman_numeral << NUMBERS_TO_NUMERALS[400]
    when 5
      roman_numeral << NUMBERS_TO_NUMERALS[500]
    when 9 
      roman_numeral << NUMBERS_TO_NUMERALS[900]
    end
  end

  def thousands(digit)
    case digit
    when 0 
      ''
    when 1..3
      roman_numeral << NUMBERS_TO_NUMERALS[1000] * digit
    else
      'Number is out of range.'
    end
  end
end

number = RomanNumerals.new(89)
p number.to_roman