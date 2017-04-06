
# require_relative 'clever_octopus'

# A Very Hungry Octopus wants to eat the longest fish in an array
# of fish
#
class BigOctopus
  FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
  # expected output on finding longest => "fiiiissshhhhhh"

  def find_longest_fish
  end

end

class SluggishOctopus < BigOctopus

  # O(n^2)
  def find_longest_fish
    longest = ""

    (0...FISH.length).each do |i|
      (i+1...FISH.length).each do |j|
        longer = FISH[i].size > FISH[j].size ? FISH[i] : FISH[j]
        longest = longer.size > longest.size ? longer : longest
      end
    end

    longest
  end
end

class DominantOctopus < BigOctopus

  # O(n log(n)) -- merge sort
  def find_longest_fish
    merge_sort(FISH).last
  end

  private

  def merge_sort(array)
    return array if array.length <= 1

    mid = array.length / 2
    left = array.take(mid)
    right = array.drop(mid)

    merge(merge_sort(left), merge_sort(right))
  end

  def merge(left, right)
    sorted = []

    until left.empty? || right.empty?
      if left.first.size < right.first.size
        sorted << left.shift
      else
        sorted << right.shift
      end
    end

    sorted + left + right
  end
end

class CleverOctopus < BigOctopus

  # O(n)
  def find_longest_fish
    longest = ""
    FISH.each do |fish|
      longest = fish.size > longest.size ? fish : longest
    end

    longest
  end
end

if $PROGRAM_NAME == __FILE__
  sluggish = SluggishOctopus.new
  dominant = DominantOctopus.new
  clever = CleverOctopus.new
  
  # these will all print same fish
  p "SLUGGISH: #{sluggish.find_longest_fish}"
  p "DOMINANT: #{dominant.find_longest_fish}"
  p "CLEVER: #{clever.find_longest_fish}"
end
