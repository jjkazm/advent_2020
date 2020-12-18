# frozen_string_literal: true

input = File.readlines('i2a.txt')

def valid?(string)
  arr = string.split
  pos_1 = arr[0].split('-')[0].to_i
  pos_2 = arr[0].split('-')[1].to_i
  check_1 = arr[2][pos_1 - 1] == arr[1][0] ? 1 : 0
  check_2 = arr[2][pos_2 - 1] == arr[1][0] ? 1 : 0

  result = (check_1 + check_2) == 1 ? 1 : 0
  result
end

puts input.reduce(0) { |tot, eleme| tot + valid?(eleme) }
