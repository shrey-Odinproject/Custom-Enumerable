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
    self.my_each do |item|
      y_i = yield item
      formatted.push(item) if y_i != false && y_i!=nil # nil case is for when u use puts nil&false are non truthy
    end
    formatted
  end

  def my_all?
    filtered=self.my_select do |item|
      yield item
    end
    filtered.length==length # all items passed test and were selected
  end

  def my_any?
    filtered=self.my_select do |item|
      yield item
    end
    filtered.length>0 # any 1 or more items were selected
  end

  def my_none?
    filtered=self.my_select do |item|
      yield item
    end
    filtered.length==0
  end
end

numbers = [1, 2, 3, 4, 5]

# numbers.my_each  { |item| puts item }
# numbers.each { |item| puts item }

# numbers.each_with_index {|item, idx| puts "#{idx} #{item}"}
# numbers.my_each_with_index {|item, idx| puts "#{idx} -> #{item}"}

# p numbers.select { |item|  puts item.even? }
# p numbers.my_select { |item| puts item.even? }

# numbers.all? { |item| item > 0 }
# numbers.my_all? { |item| item > 0 }

# p numbers.any? {|item| item >9}
# p numbers.my_any? {|item| item >9}

# p numbers.none? { |item| item > 110 }
# p numbers.my_none? { |item| item > 110 }
