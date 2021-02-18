require_relative '../data_converter'

module Solution
  DIRECTIONS = %w[N E S W].freeze
  include DataConverter
  def result(file)
    insts = lines(file).map { |line| [line[0], line[1..-1].to_i] }
    count(steps({ 'E' => 10, 'N' => 1 }, insts))
  end

  def count(hash)
    (hash['E'] - hash['W']).abs + (hash['N'] - hash['S']).abs
  end

  def steps(initial, instructions)
    result = { 'N' => 0, 'E' => 0, 'S' => 0, 'W' => 0 }
    waypoint = initial
    instructions.each do |i|
      puts "instruction: #{i}, result: #{result}"
      case i[0]
      when 'R', 'L'
        waypoint = rotate_waypoint(waypoint, i[0], i[1])
      when 'F'
        waypoint.keys.each { |direction| result[direction] += i[1] * waypoint[direction] }
      else

        waypoint = move_waypoint(waypoint, i[0], i[1])
      end
    end
    result
  end

  def rotate_waypoint(initial, direction, val)
    initial.keys.map { |k| [change_dir(k, direction, val), initial[k]] }.to_h
  end

  def move_waypoint(initial, direction, val)
    opposites = { 'S' => 'N', 'N' => 'S', 'E' => 'W', 'W' => 'E' }

    if initial[direction].nil?
      oppo_dir = opposites[direction]
      initial[oppo_dir] -= val
      if initial[oppo_dir] < 0
        initial[direction] = -initial[oppo_dir]
        initial.delete(oppo_dir)
      end
    else
      initial[direction] += val
    end
    initial
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
