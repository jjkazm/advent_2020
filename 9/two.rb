# frozen_string_literal: true

require_relative '../data_converter.rb'

module Solution
  include DataConverter
  def result(file, num)
    numbers = lines(file).map(&:to_i)
    cleaner_array = remove_bigger_nums_from_array(numbers, num)
    find_array(cleaner_array, num)
  end

  def find_array(arr, num)
    i = 2
    loop do
      puts "i: #{i}"
      hash = available_arrays(arr, i)
      puts hash
      puts "class: #{hash.class}"
      puts "num: #{num}"
      puts "check: #{hash[127]}"
      if hash[num]
        return hash[num].min + hash[num].max
      else
        i += 1
      end
    end
  end

  def remove_bigger_nums_from_array(arr, n)
    index_of_last_not_bigger = arr.each_with_index.map { |x, i| [x, i] }
                                  .filter { |pair| pair[0] <= n }
                                  .map { |pair| pair[1] }.max
    arr[0..index_of_last_not_bigger]
  end

  def available_arrays(arr, number_of_ingridents)
    (0..arr.length - number_of_ingridents).map { |i| [arr[i, number_of_ingridents].sum, arr[i, number_of_ingridents]] }.to_h
  end

  def call
    result('./9/input.txt', 144_381_670)
  end

  def call_sample
    result('./9/sample.txt', 127)
  end
end
