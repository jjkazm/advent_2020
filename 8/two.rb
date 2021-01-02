# frozen_string_literal: true

require_relative '../data_converter.rb'

module Solution
  include DataConverter
  def result(file)
    instructions = lines(file).map { |line| line.split(' ') }.map { |line| { instruction: line[0], value: line[1].to_i } }
    sum = 0

    (0..(instructions.length - 1)).each do |i; dup|
      dup = instructions.dup
      if dup[i][:instruction] == 'acc'
        next
      else
        dup[i][:instruction] = toggle(dup[i][:instruction])
      end

      puts "dup: #{dup}"
      sum = sum_from_instructions(dup)[0]
      break if sum_from_instructions(dup)[1] == true

      dup[i][:instruction] = toggle(dup[i][:instruction])
    end
    sum
  end

  def toggle(instruction)
    case instruction
    when 'nop'
      'jmp'
    when 'jmp'
      'nop'
    else
      instruction
    end
  end

  def sum_from_instructions(instructions)
    position = 0
    sum = 0
    used_instructions = []
    success = true

    until (used_instructions.include? position) || (position >= instructions.length)
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
      success = false if used_instructions.include? position
    end
    puts "[sum, success] #{[sum, success]} // position: #{position} // length: #{instructions.length - 1}"
    [sum, success]
  end

  def call
    result('./8/input.txt')
  end

  def call_sample
    result('./8/sample.txt')
  end
end
