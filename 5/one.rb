# frozen_string_literal: true

class Solution
  class << self
    def call(file); end

    def tickets(file)
      File.readlines(file)
    end
  end
end

# Solution getting file and Solver class.
