# frozen_string_literal: true

input = File.readlines('i2a.txt')

def valid?(string)
  arr = string.split
  min = arr[0].split('-')[0].to_i
  max = arr[0].split('-')[1].to_i
  count = arr[2].count(arr[1][0])
  result = min <= count && count <= max ? 1 : 0
  puts "#{min}<#{count}<#{max}, result: #{result}"
  result
end

puts input.reduce(0) { |tot, eleme| tot + valid?(eleme) }
