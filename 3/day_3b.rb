# frozen_string_literal: true

module Solution
  INPUT = File.readlines('i3a.txt').map { |line| line.gsub("\n", '') }
  SAMPLE_INPUT = File.readlines('isample.txt').map { |line| line.gsub("\n", '') }
  def get_string(place_step, line_step, input)
    result_array = []
    input.each_with_index do |el, index|
      if (index % line_step).zero?
        result_array << find_char(el, place_step * (index / line_step))
      end
    end
    result_array.join
  end

  def count_hashes(string)
    string.count('#')
  end

  def find_char(string, num)
    string[num % string.length]
  end

  def result(input)
    a = count_hashes(get_string(1, 1, input))
    b = count_hashes(get_string(3, 1, input))
    c = count_hashes(get_string(5, 1, input))
    d = count_hashes(get_string(7, 1, input))
    e = count_hashes(get_string(1, 2, input))

    puts "Right 1, down 1: #{a}"
    puts "Right 3, down 1: #{b}"
    puts "Right 5, down 1: #{c}"
    puts "Right 7, down 1: #{d}"
    puts "Right 1, down 2: #{e}"
    a * b * c * d * e
  end

  puts "result is #{result(INPUT)}"
end
