# Write a program that takes a word and a list of possible anagrams and selects the correct 
# sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists", "google", 
# "inlets", and "banana", the program should return a list containing "inlets". Please read the 
# test suite for the exact rules of anagrams.

class Anagram
  attr_reader :word

  def initialize(string)
    @word = string
  end

  def match(list)
    list.select do |anagram|
      anagram.downcase != word.downcase &&
      anagram.downcase.chars.sort == word.downcase.chars.sort 
    end
  end
end

detector = Anagram.new('ant')
p detector.match(%w(tan stand at))