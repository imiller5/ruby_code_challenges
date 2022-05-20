# Write a program that, given a word, computes the Scrabble score for that word.

# Letter Values

# You'll need the following tile scores:

# Letter	Value
# A, E, I, O, U, L, N, R, S, T	1
# D, G	2
# B, C, M, P	3
# F, H, V, W, Y	4
# K	5
# J, X	8
# Q, Z	10
# How to Score

# Sum the values of all the tiles used in each word. For instance, lets consider the word 
# CABBAGE which has the following letters and point values:

# 3 points for C
# 1 point for each A (there are two)
# 3 points for B (there are two)
# 2 points for G
# 1 point for E

class Scrabble
  LETTER_VALUES = {1 => 'AEIOULNRST', 2 => 'DG', 3 => 'BCMP',
                   4 => 'FHVWY', 5 => 'K', 8 => 'JX', 10 => 'QZ'}

  attr_reader :word

  def initialize(string)
    @word = string
  end

  def score
    total = 0
    return total if word == '' || word == nil
    word.chars.each do |letter|
      LETTER_VALUES.each do |key, array|
        total += key if array.include?(letter.upcase)
      end
    end
    total
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

p Scrabble.score('Cabbage')
