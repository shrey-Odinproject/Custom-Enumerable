require './custom_enumerable.rb'

numbers = [1, 2, 3, 4, 5]
t = Proc.new { |item| item + 100 }
r = ->(x) { x * 2 }

numbers.my_each { |item| puts item }
numbers.each { |item| puts item }

numbers.each_with_index { |item, idx| puts "#{idx} #{item}" }
numbers.my_each_with_index { |item, idx| puts "#{idx} -> #{item}" }

p numbers.select { |item|  puts item.even? }
p numbers.my_select { |item| puts item.even? }

numbers.all? { |item| item > 0 }
numbers.my_all? { |item| item > 0 }

p numbers.any? { |item| item > 9 }
p numbers.my_any? { |item| item > 9 }

p numbers.none? { |item| item > 110 }
p numbers.my_none? { |item| item > 110 }

p numbers.count { |x| x > 3 }
p numbers.my_count { |x| x > 3 }

p numbers.map { |item| item**2 }
p numbers.my_map { |item| item**2 }

p numbers.inject { |result, elm| result - elm }
p numbers.my_inject { |result, elm| result - elm }

collection = [[1, 'one'], [2, 'two'], [3, 'three'],
              [4, 'four'], [5, 'five']]

x = collection.my_inject({}) do |hash, value|
  hash[value.first] = value.last
  hash
end

p x
p ['cat', ' ', 'dawg', '  ', 'op '].my_inject('jjk') { |acc, item| acc + item }

p multiply_els([2, 4, 5])

p numbers.my_map(t) { |x| x - 1000 }
p numbers.my_map { |x| x - 1000 }

p multiply_els([2, 4, 5])

p numbers.my_map(t) { |x| x - 1000 }
p numbers.my_map { |x| x - 1000 }
