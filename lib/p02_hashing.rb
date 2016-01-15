class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    inject(0) do |accumulator, el|
      accumulator.hash + el.to_i.hash
    end
  end
end

class String
  def hash
    chars.inject(0) do |accumulator, el|
      accumulator.hash + el.ord.hash
    end
  end
end

# class Hash
#   def hash
#   end
# end
