require_relative 'big_o_ctopus'
require 'byebug'
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
