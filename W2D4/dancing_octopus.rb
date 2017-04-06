class DancingOctopus
  TILES_ARRAY = ["up", "right-up", "right", "right-down", "down", "left-down", "left", "left-up"]
  TILES_HASH = {
    "up" => 0,
    "right-up" => 1,
    "right" => 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
  }

  # O(n)
  def slow_dance(direction)
    TILES_ARRAY.each_with_index do |dir, i|
      return i if dir == direction
    end
  end

  # O(1) Uses constant time lookup of a hash
  def fast_dance(direction)
    TILES_HASH[direction]
  end
end

if $PROGRAM_NAME == __FILE__
  octopus = DancingOctopus.new

  # will return same result
  p octopus.slow_dance("up") == 0
  p octopus.slow_dance("right-down") == 3
  p octopus.fast_dance("up") == 0
  p octopus.slow_dance("right-down") == 3
end
