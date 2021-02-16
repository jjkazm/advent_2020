require_relative '../data_converter'

module Solution
  DIRECTIONS = %w[N E S W].freeze
  include DataConverter
  def result(file)
    insts = lines(file).map { |line| [line[0], line[1..-1].to_i] }
    count(steps('E', insts))
  end

  def count(hash)
    (hash['E'] - hash['W']).abs + (hash['N'] - hash['S']).abs
  end

  def steps(initial, instructions)
    result = { 'N' => 0, 'E' => 0, 'S' => 0, 'W' => 0 }
    direction = initial
    instructions.each do |i|
      puts "instruction: #{i}, result: #{result}"
      case i[0]
      when 'R', 'L'
        direction = change_dir(direction, i[0], i[1])
      when 'F'
        result[direction] += i[1]
      else
        result[i[0]] += i[1]
      end
    end
    result
  end

  def change_dir(initial, direction, val)
    init = DIRECTIONS.index initial
    change = direction == 'R' ? val / 90 : val / -90
    DIRECTIONS[(change + init) % 4]
  end

  def call
    result('./12/input.txt')
  end

  def call_sample
    result('./12/sample.txt')
  end
end
