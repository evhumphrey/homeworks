require_relative 'sluggish_octopus'
# require_relative 'dominant_octopus'
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

if $PROGRAM_NAME == __FILE__
  sluggish = SluggishOctopus.new
  
  p "SLUGGISH: #{sluggish.find_longest_fish}"

end
