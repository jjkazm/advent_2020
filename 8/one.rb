# frozen_string_literal: true

require_relative '../data_converter.rb'

module Solution
  include DataConverter
  def result(file)
    instructions = lines(file).map { |line| line.split(' ') }.map { |line| { instruction: line[0], value: line[1].to_i } }

    position = 0
    sum = 0
    used_instructions = []

    until used_instructions.include? position
      puts "postion: #{position}"
      puts "instruction: #{instructions[position]}"
      puts "sum: #{sum}"
      puts '========'
      used_instructions << position

      case instructions[position][:instruction]
      when 'acc'
        sum += instructions[position][:value]
        position += 1
      when 'nop'
        position += 1
      when 'jmp'
        position += instructions[position][:value]
      end
    end
    sum
  end

  def call
    result('./8/input.txt')
  end

  def call_sample
    result('./8/sample.txt')
  end
end
