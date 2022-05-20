# Write a program that can calculate the Hamming distance between two DNA strands.

## By counting the number of differences between two homologous DNA strands taken from 
# different genomes with a common ancestor, we get a measure of the minimum number of 
# point mutations that could have occurred on the evolutionary path between the two 
# strands.

# This is called the Hamming distance.

# If one strand is shorter than the other, we only need to check for differences for the 
# length of the shorter strand.

class DNA
  attr_reader :strand

  def initialize(dna_strand)
    @strand = dna_strand
  end

  def hamming_distance(other)
    if self.size == other.size
      same_size(other)
    elsif self.size < other.size
      find_difference(self.strand, other)
    else
      find_difference(other, self.strand)
    end
  end

  private

  def same_size(other)
    diff = 0
    0.upto(self.size - 1) do |index|
      if self.strand.split('')[index] != other.split('')[index]
        diff += 1
      end
    end
    diff
  end

  def find_difference(smaller, larger)
    diff = 0
    0.upto(smaller.size - 1) do |index|
      if smaller.split('')[index] != larger.split('')[index]
        diff += 1
      end
    end
    diff
  end

  protected

  def size
    self.strand.size
  end
end

strand1 = DNA.new('GGACGGATTCTGACCTGGACTAATTTTGGGG')
p strand1.hamming_distance('AGGACGGATTCTGACCTGGACTAATTTTGGGG')