# frozen_string_literal: true

require_relative '../data_converter.rb'

module Solution
  include DataConverter
  def result(file)
    rules = lines(file).map { |line| line.split(' bags contain') }
    outer_bags(rules, ['shiny gold']).count - 1
  end

  def outer_bags(rule_pairs, searched)
    puts "rule_pairs: #{rule_pairs.count}, searched: #{searched}"

    outer = searched.map { |search| rule_pairs.filter { |pair| pair[1].include?(search) }.map { |pair| pair[0] } }
                    .reduce{ |all, element| all + element }
    result = (outer + searched).uniq
    return searched if searched == result

    outer_bags(rule_pairs, result)
  end

  def call
    result('./7/input.txt')
  end

  def call_sample
    result('./7/sample.txt')
  end
end
