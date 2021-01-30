# frozen_string_literal: true

require_relative '../data_converter.rb'

module Solution
  include DataConverter
  def result(file)
    numbers = lines(file).map(&:to_i).sort
    puts numbers
    diff = differences(numbers) + [1, 3]
    puts "diff.count(3): #{diff.count(3)}"
    puts "diff.count(1): #{diff.count(1)}"

    diff.count(3) * diff.count(1)
  end

  def differences(arr)
    (0...(arr.length - 1)).map { |i| arr[i + 1] - arr[i] }
  end

  def call
    result('./10/input.txt')
  end

  def call_sample
    result('./10/sample.txt')
  end
end
