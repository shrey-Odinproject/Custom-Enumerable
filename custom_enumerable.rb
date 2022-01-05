module Enumerable
  def my_each
    return 'no block given' unless block_given?

    i = 0
    while i != self.length
      yield self[i]
      i += 1
    end
    self
  end
end

puts "my_each vs. each"
numbers = [1, 2, 3, 4, 5]
numbers.my_each  { |item| puts item }
numbers.each { |item| puts item }
