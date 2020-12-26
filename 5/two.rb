# frozen_string_literal: true

module Solution
  def test
    puts 'it works'
  end

  def row(string, arr)
    # puts "string: #{string}, arr: #{arr}"

    return arr[0] if arr[0] == arr[1]

    front_arr = [arr[0], arr[1] - (arr[1] - arr[0]) / 2 - 1]
    back_arr = [arr[1] - (arr[1] - arr[0]) / 2, arr[1]]

    string[0] == 'F' ? row(string[1..-1], front_arr) : row(string[1..-1], back_arr)
  end

  def column(string, arr)
    # puts "string: #{string}, arr: #{arr}"
    # puts "arr[0]: #{arr[0]}"
    return arr[0] if arr[0] == arr[1]

    front_arr = [arr[0], arr[1] - (arr[1] - arr[0]) / 2 - 1]
    back_arr = [arr[1] - (arr[1] - arr[0]) / 2, arr[1]]

    string[0] == 'L' ? column(string[1..-1], front_arr) : column(string[1..-1], back_arr)
  end

  def value(code)
    row = row(code[0..6], [0, 127])
    column = column(code[7..9], [0, 7])
    # puts "row: #{row}"
    # puts "column: #{column}"
    row * 8 + column
  end

  def call
    ids = File.readlines('./5/input.txt').map { |code| value(code) }.sort
    # puts ids
    puts (ids[0]..ids[-1]).to_a

    (ids[0]..ids[-1]).to_a - ids
  end
end

# Solution getting file and Solver class.
