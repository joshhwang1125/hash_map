class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def inspect
    @val
  end
end

class LinkedList
  include Enumerable

  attr_accessor :head, :tail

  def initialize
    @head = Link.new
    # @head.prev = Link.new
    @tail = Link.new
    # @tail.next = Link.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    @head.key.nil?
  end

  def get(key)
    each { |link| return link.val if link.key == key}
    nil
  end

  def include?(key)
    each { |link| return true if link.key == key}
    false
  end

  def insert(key, val)
    new_link = Link.new(key, val)
    if empty?
      @head, @tail = new_link, new_link
    else
      new_link.prev = @tail
      @tail.next = new_link
      @tail = new_link
    end
  end

  def remove(key)
    if @head.key == key
      @head = @head.next
    elsif @tail.key == key
      @tail = @tail.prev
    else
      each do |link|
        if link.key == key
          prev_link = link.prev
          next_link = link.next
          prev_link.next = next_link
          next_link.prev = prev_link
        end
      end
    end
    nil
  end

  def each(&prc)
    current_link = @head

    until current_link.nil?
      prc.call(current_link)
      current_link = current_link.next
    end
    self
  end

  def inspect
    each { |link| p link }
  end

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
