class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError.new if valid? == false
  end

  def valid?
    sides.min > 0 &&
    sides[0] + sides[1] > sides[2] &&
    sides[0] + sides[2] > sides[1] &&
    sides[1] + sides[2] > sides[0]
  end

  def kind
   return "equilateral" if equilateral?
   return "isosceles" if isosceles?
   "scalene"
  end

  def equilateral?
    sides.uniq.size == 1
  end

  def isosceles?
    sides.uniq.size == 2
  end

  def scalene?
    sides.uniq.size == 3
  end
end

# equilateral = Triangle.new(2, 2, 2)
# isosceles = Triangle.new(2, 2, 3)
# scalene = Triangle.new(2, 3, 4)
# invalid = Triangle.new(2, 2, 6)
# p equilateral.kind
# p isosceles.kind
# p scalene.kind