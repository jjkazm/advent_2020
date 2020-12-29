# frozen_string_literal: true

require_relative '../data_converter.rb'

module Solution
  include DataConverter
  def result(file)
    rules = lines(file).map { |line| line.split(' bags contain') }

    containing_recurssive([], [[1, 'shiny gold']], rules).reduce(0) { |sum, b| sum + (b[0] || 0) }
  end

  def containing_recurssive(all, bags, rules)
    inner_bags = multiple_containing(bags, rules)

    return all if inner_bags.all?(&:empty?)

    all_updated = all + inner_bags

    containing_recurssive(all_updated, inner_bags, rules)
  end

  def multiple_containing(bags, rules)
    bags.reduce([]) { |result, bag| result + containing(bag, rules) }
  end

  def containing(bag, rules)
    parent_quantity, parent_type = bag
    puts "parent_quantity: #{parent_quantity}"

    puts "parent_type: #{parent_type}"
    bags_inside = rules.filter { |pair| pair[0] == parent_type }[0]

    bags_inside = bags_inside ? bags_inside[1].strip : nil
    puts "bags_inside: #{bags_inside}"
    normalize(bags_inside, parent_quantity)
  end

  def normalize(string, parent_quantity)
    return [] unless string

    string.split(',').map do |bag_type|
      quantity = bag_type.split(' ')[0].to_i * parent_quantity
      type = bag_type.split(' ')[1] + ' ' + bag_type.split(' ')[2]
      quantity.zero? ? [] : [quantity, type]
    end
  end

  def call
    result('./7/input.txt')
  end

  def call_sample
    result('./7/sample2.txt')
  end
end
