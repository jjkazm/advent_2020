require_relative '../data_converter'

module Solution
  DIRECTIONS = %w[N E S W].freeze
  include DataConverter
  def result(file)
    insts = lines(file).map { |line| [line[0], line[1..-1].to_i] }
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
