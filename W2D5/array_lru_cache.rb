class LRUCache
  # older at beginning, newer at end
  def initialize(size = 4)
    @size = size
    @cache = []
  end

  def count
    @cache.length
  end

  def add(el)

    @cache.each.with_index do |obj, i|
      if el == obj
        updated = @cache.delete_at(i)
        @cache << updated
        return
      end
    end

    @cache << el
    if count > @size
      @cache.shift
    end

  end

  def show
    p @cache
  end

  private

  def eject_least_recent
    @cache.shift
  end

  def el_index(el)
    @cache.each.with_index { |obj, i| return i if obj == el }
    false
  end

end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)


johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


p johnny_cache.show == [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
