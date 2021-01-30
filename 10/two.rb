# frozen_string_literal: true

require_relative '../data_converter.rb'

module Solution
  include DataConverter
  def result(file)
    numbers = lines(file).map(&:to_i)
    numbers += [0, numbers.max + 3]
    numbers.sort!
    # all_removals = all_possible_removals(numbers)
    # puts "count: #{all_possible_removals(numbers).length} "
    # all_removals.filter { |removal| valid(numbers - removal) }.length + 1

    puts "possible_removals(numbers): #{possible_removals(numbers)}"
    possible_removals = possible_removals(numbers)
    values = get_groups(possible_removals)
    2**(values[1] || 0) * 4**(values[2] || 0) * 7**(values[3] || 0)
  end

  def possible_removals(arr)
    (1...(arr.length - 1)).map { |i| [arr[i], arr[i + 1] - arr[i - 1]] }
                          .filter { |pair| pair[1] == 2 }
                          .map { |pair| pair[0] }
  end

  def get_groups(arr)
    result = []
    arr.each do |num|
      last_num = result.last&.last || -1

      last_num + 1 == num ? result.last << num : result << [num]
    end
    lengths = result.map(&:length)
    lengths.uniq.map { |l| [l, lengths.count(l)] }.to_h
  end

  def all_possible_removals(arr)
    removals = possible_removals(arr)

    (1..removals.length).map { |i| removals.combination(i).to_a }.flatten(1)
  end

  def differences(arr)
    (0...(arr.length - 1)).map { |i| arr[i + 1] - arr[i] }
  end

  def valid(arr)
    differences(arr).max <= 3
  end

  def call
    result('./10/input.txt')
  end

  def call_sample
    result('./10/sample.txt')
  end

  def call_sample2
    result('./10/sample2.txt')
  end
end
