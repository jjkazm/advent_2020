# frozen_string_literal: true

module Solution
  INPUT = File.readlines('i3a.txt').map { |line| line.gsub("\n", '') }
  def get_string(place, input)
    result_array = []
    input.each_with_index { |el, index| result_array << find_char(el, place * index) }
    result_array.join
  end

  def count_hashes(string)
    string.count('#')
  end

  def find_char(string, num)
    string[num % string.length]
  end

  puts "result is #{count_hashes(get_string(3, INPUT))}"
end
