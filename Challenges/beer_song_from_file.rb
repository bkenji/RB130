# 4:05 - 5:05

# SPIKE:

class BeerSong
  @song = File.open("beer_song.txt").readlines("").reverse

  def self.verse(verse_number)
    @song[verse_number].chomp
  end

  def self.verses(*verse_numbers)
    verses = ""
    verse_numbers.first.downto(verse_numbers.last)  do |verse_number|
       verses += self.verse(verse_number) + "\n"
       end
    verses.chomp
  end

  def self.lyrics
    verses(99, 0)
  end
end
