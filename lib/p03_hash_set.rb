require_relative 'p02_hashing'

class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    self[key] << key
    @count += 1
    resize! if @count == @store.count
  end

  def remove(key)
    self[key].delete(key)
    @count -= 1
  end

  def include?(key)
    self[key].include?(key)
  end

  private

  def [](key)
    @store[key.hash % @store.count]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = HashSet.new(@store.count * 2)
    @store.each do |bucket|
      bucket.each do |el|
        new_store.insert(el)
      end
    end

  @store = new_store.store
  end

end
