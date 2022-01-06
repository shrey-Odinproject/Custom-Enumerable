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

# p numbers.count(0)
# p numbers.my_count(0)

# p numbers.map { |item| item**2 }
# p numbers.my_map { |item| item**2 }

# p numbers.inject { |result, elm| result - elm }
# p numbers.my_inject { |result, elm| result - elm }

=begin
collection = [ [1, 'one'], [2, 'two'], [3, 'three'],
	 [4, 'four'], [5, 'five'] 
	 ]
	
x=collection.my_inject({}) do |hash, value|
  hash[value.first] = value.last 
  hash
end
p x
p ['cat',' ','dawg','  ' ,'op '].my_inject('jjk'){|acc,item| acc+item}
=end

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
      formatted.push(item) if y_i != false && y_i != nil # nil case is for when u use puts nil&false are non truthy
    end
    formatted
  end

  def my_all?
    filtered = self.my_select do |item|
      yield item
    end
    filtered.length == length # all items passed test and were selected
  end

  def my_any?
    filtered = self.my_select do |item|
      yield item
    end
    filtered.length > 0 # any 1 or more items were selected
  end

  def my_none?
    filtered = self.my_select do |item|
      yield item
    end
    filtered.length == 0
  end

  def my_count(elm = nil)
    counter = 0
    self.my_each do |item|
      yield item if block_given? # do we even need this?
      if elm == nil
        counter += 1
      else
        counter += 1 if item == elm
      end
    end
    counter
  end

  def my_map(proc)
    formatted = []
    self.my_each do |item|
      formatted.push(proc.call(item))
    end
    formatted
  end

  def my_inject(arg = nil)
    if arg==nil
      accm=self[0]
      self[1..].each do |item|
        accm = yield(accm, item)
      end
      return accm
    elsif arg.is_a?(Integer)
      accm=arg.to_i
      self.each do |item|
        accm=yield(accm,item)
      end
      return accm
    elsif arg.is_a?(Hash)
      accm=arg.to_h
      self.each do |item|
        accm=yield(accm,item)
      end
      return accm
    elsif arg.is_a?(String)
      accm=arg.to_s
      self.each do |item|
        accm=yield(accm,item)
      end
      return accm
    end
  end
end

numbers = [1, 2, 3, 4, 5]

def multiply_els(arr)
  arr.my_inject {|result, item| result*item}
end

# p multiply_els([2,4,5])

t= Proc.new {|item| item+100}
r= ->(x) {x*2}
p numbers.my_map(t)
p numbers.my_map(r)