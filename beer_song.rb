require 'pry'

class BeerSong
  VERSE = ["bottles of beer on the wall,", "bottles of beer.\n", 
           "Take one down and pass it around,", "bottles of beer on the wall.\n"]
  ANTEPENULTIMATE_VERSE = "2 bottles of beer on the wall, 2 bottles of beer.\n" +
                          "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  PENULTIMATE_VERSE = "1 bottle of beer on the wall, 1 bottle of beer.\n" +
                      "Take it down and pass it around, no more bottles of beer on the wall.\n"
  LAST_VERSE = "No more bottles of beer on the wall, no more bottles of beer.\n" +
               "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

  def self.lyrics
    self.verses(99, 0)
  end

  def self.verses(beginning_verse, ending_verse)
    result = []
    verse_array = (ending_verse..beginning_verse).to_a.reverse
    verse_array.each do |num|
      case num 
      when 0
        result << LAST_VERSE
      when 1 
        result << PENULTIMATE_VERSE
      when 2 
        result << ANTEPENULTIMATE_VERSE
      else
        if num == ending_verse
          result << "#{num} #{VERSE[0]} #{num} #{VERSE[1]}" +
                    "#{VERSE[2]} #{num - 1} #{VERSE[3]}"
        else
          result << "#{num} #{VERSE[0]} #{num} #{VERSE[1]}" + 
                    "#{VERSE[2]} #{num - 1} #{VERSE[3]}"
        end
      end
    end
    result.join("\n")
  end

  def self.verse(verse)
    case verse 
    when 0
      LAST_VERSE
    when 1 
      PENULTIMATE_VERSE
    when 2
      ANTEPENULTIMATE_VERSE
    else
      "#{verse} #{VERSE[0]} #{verse} #{VERSE[1]}" +
                 "#{VERSE[2]} #{verse - 1} #{VERSE[3]}"
    end

    # private

    # def default_verse
    #   "#{bottles} bottles of beer on the wall, #{bottles}" +
    #   " bottles of beer.\nTake one down and pass it around, " +
    #   "#{bottles-1} bottles of beer on the wall.\n"
    # end
  
    # def two_bottle_verse
    #   "2 bottles of beer on the wall, 2 bottles of beer.\n" +
    #   "Take one down and pass it around, 1 bottle of beer " +
    #   "on the wall.\n"
    # end
  
    # def single_bottle_verse
    #   "1 bottle of beer on the wall, 1 bottle of beer.\n" +
    #   "Take it down and pass it around, no more bottles of beer " +
    #   "on the wall.\n"
    # end
  
    # def zero_bottle_verse
    #   "No more bottles of beer on the wall, no more bottles " +
    #   "of beer.\nGo to the store and buy some more, 99 bottles " +
    #   "of beer on the wall.\n"
    # end
  end

  # def self.verse_array(verses)
  #   if verses.size == 1
  #     verses = [verses]
  #   elsif verses.size == 2
  #     verses = (verses[1]..verses[0]).to_a.reverse
  #   end
  # end
end

puts BeerSong.verse(99)
# BeerSong.lyrics
