# Write a program that, given a natural number and a set of one or more other numbers, can 
# find the sum of all the multiples of the numbers in the set that are less than the first number. 
# If the set of numbers is not given, use a default set of 3 and 5.

# For instance, if we list all the natural numbers up to, but not including, 20 that are 
# multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples 
# is 78.

class SumOfMultiples
  attr_reader :multiples

  def initialize(*multiples)
    @multiples = (multiples.size > 0) ? multiples : [3, 5]
  end

  def self.to(n) 
    SumOfMultiples.new.to(n)
  end

  def to(n)
    result = []
    1.upto(n - 1) do |n|
      multiples.each do |multiple|
        result << n if n % multiple == 0
      end
    end
    result.uniq.sum
  end
end