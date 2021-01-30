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
    return 'L' if value == '#' && seated_neighbours > 3

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
    top = row.zero?
    bottom = row + 1 == arr.length
    left = column.zero?
    right = column + 1 == arr[row].length

    unless top
      result << arr[row - 1][column - 1] unless left
      result << arr[row - 1][column]
      result << arr[row - 1][column + 1] unless right
    end
    result << arr[row][column + 1] unless right

    unless bottom
      result << arr[row + 1][column + 1] unless right
      result << arr[row + 1][column]
      result << arr[row + 1][column - 1] unless left
    end
    result << arr[row][column - 1] unless left

    result.count('#')
  end

  def call
    result('./11/input.txt')
  end

  def call_sample
    result('./11/sample.txt')
  end
end
