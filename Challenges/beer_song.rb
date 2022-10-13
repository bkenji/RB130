
class BeerSong
  def self.verse(count)
    "#{format(count)} of beer on the wall, #{bottle(count)} of beer.\n" \
      "#{count.zero? ? verse_zero : default_verse(count)}"
  end

  def self.verses(*counts)
    set_of_verses = ""
    counts.first.downto(counts.last) do |count|
      set_of_verses += verse(count) + "\n"
    end
    set_of_verses.chomp
  end

  def self.lyrics
    verses(99, 0)
  end

  class << self 
    
    private

    def bottle(count)
      if count > 1 
        "#{count} bottles"
      elsif count == 1
        "#{count} bottle"
      else
        "no more bottles"
      end
    end

    def format(count)
      bottle(count).is_a?(String) ? bottle(count).capitalize : bottle(count)
    end

    def verse_zero
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end

    def default_verse(count)
      "Take #{count == 1 ? "it" : "one"} down and pass it around," \
       " #{bottle(count - 1)} of beer on the wall.\n"
    end
  end
end
