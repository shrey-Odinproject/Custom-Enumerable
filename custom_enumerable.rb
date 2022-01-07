
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
      if block_given? 
        counter+=1 if (yield item) ==true
      elsif elm == nil
        return self.size
      else
        counter += 1 if item == elm
      end
    end
    counter
  end

  def my_map(proc=nil)
    formatted = []
    if proc!=nil
      self.my_each do |item|
        formatted.push(proc.call(item))
      end
    else
      self.my_each do |item|
        formatted.push(yield(item))
      end
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

def multiply_els(arr)
  arr.my_inject {|result, item| result*item}
end
