require_relative '../data_converter'

module Solution
  include DataConverter
  def result(file)
    rows = lines(file)
    puts rows.class

    multiple_arr_toggle(rows)
  end

  def multiple_arr_toggle(arr)
    prev = ''

    while prev != arr
      prev = arr
      arr = toggle_array(arr)
    end
    count_seated(arr)
  end

  def toggle(value, seated_neighbours)
    return '#' if value == 'L' && seated_neighbours.zero?
    return 'L' if value == '#' && seated_neighbours > 4

    value
  end

  def toggle_array(arr)
    arr.map.with_index do |line, row|
      line.chars.map.with_index do |val, column|
        toggle(val, seated_neighbours_count(row, column, arr))
      end.join('')
    end
  end

  def count_seated(arr)
    arr.join.count('#')
  end

  def seated_neighbours_count(row, column, arr)
    result = ''
    result << neighbour(row, column, 0, 1, arr)
    result << neighbour(row, column, 0, -1, arr)
    result << neighbour(row, column, 1, 0, arr)
    result << neighbour(row, column, 1, 1, arr)
    result << neighbour(row, column, 1, -1, arr)
    result << neighbour(row, column, -1, 0, arr)
    result << neighbour(row, column, -1, 1, arr)
    result << neighbour(row, column, -1, -1, arr)

    result.count('#')
  end

  def neighbour(row, column, horizontal, vertical, arr)
    return '' if row + horizontal < 0 || row + horizontal >= arr.length
    return '' if column + vertical < 0 || column + vertical >= arr[row].length

    n = arr[row + horizontal][column + vertical]
    return n if %w[L #].include?(n)

    neighbour(row + horizontal, column + vertical, horizontal, vertical, arr)
  end

  def call
    result('./11/input.txt')
  end

  def call_sample
    result('./11/sample.txt')
  end
end
