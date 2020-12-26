# frozen_string_literal: true

require_relative '../data_converter.rb'

module Solution
  include DataConverter
  def call
    answers = multiline('./6/input.txt')

    answers.map { |a| a.chars.uniq.length }.sum
  end
end

# Solution getting file and Solver class.
