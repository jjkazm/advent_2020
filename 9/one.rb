# frozen_string_literal: true

require_relative '../data_converter.rb'

module Solution
  include DataConverter
  def result(file)
    numbers = lines(file).map(&:to_i)
    first_invalid(numbers, 25, 2)
  end

  def first_invalid(arr, preamble_size, number_of_ingridents)
    (preamble_size...arr.length).each do |i|
      preamble = arr[i - preamble_size, preamble_size]
      unless available_sums(preamble, number_of_ingridents).include? arr[i]
        return arr[i]
      end
    end
  end

  def available_sums(arr, number_of_ingridents)
    arr.permutation(number_of_ingridents).map(&:sum).uniq
  end

  def call
    result('./9/input.txt')
  end

  def call_sample
    result('./9/sample.txt')
  end
end
