# frozen_string_literal: true

require_relative '../data_converter.rb'

module Solution
  include DataConverter
  def call
    group_answers = multiline('./6/input.txt', ' ')

    group_answers.map { |group| count_all(group) }.sum
  end

  def count_all(string)
    people_num = string.split(' ').count

    uniq = string.gsub(' ', '').chars.uniq

    uniq.filter { |char| string.count(char) == people_num }.count
  end
end

# Solution getting file and Solver class.
