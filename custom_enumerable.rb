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

  def my_each_with_index
    return 'no block given' unless block_given?

    i = 0
    while i != self.length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    return 'no block given' unless block_given?

    formatted = []
    i = 0
    while i != self.length
      formatted.push(yield self[i])
      i += 1
    end
    formatted - [nil]
  end
end

numbers = [1, 2, 3, 4, 5]

# numbers.my_each  { |item| puts item }
# numbers.each { |item| puts item }

# numbers.each_with_index {|item, idx| puts "#{idx} #{item}"}
# numbers.my_each_with_index {|item, idx| puts "#{idx} -> #{item}"}

numbers.select { |item| puts item if item > 2 }
numbers.my_select { |item| puts item if item > 2 }
