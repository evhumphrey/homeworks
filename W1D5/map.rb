# map = [[k1, v1], [k2, v2], [k3, v3]]
class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    # can create a new [key, value] pair or update val for existing key
    @map.each do |pair|
      if pair.first == key
        pair[-1] = value
        return [key, value]
      end
    end

    @map << [key, value]
    [key, value]
  end

  def lookup(key)
    # find the value at specified key
  end

  def remove(key)
    # remove the [key, value] pair
  end

  def show
  end
end
