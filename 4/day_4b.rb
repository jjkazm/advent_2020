# frozen_string_literal: true

class Solution
  # attr_accessor :file

  # def initialize(file)
  #   @file = file
  # end
  class << self
    def call(file)
      # get_passports.filter { |str| binding.pry ; str_pass_valid?(str) == true }.count
      get_passports(file).filter { |str| str_pass_valid?(str) }.count
    end

    def get_passports(file)
      File.readlines(file).map { |line| line.gsub("\n", '') }
          .map { |el| el == '' ? 'split' : el }
          .join(' ').split('split')
    end

    def s_to_arr(string)
      pair = string.split(':')
      [pair[0].to_sym, pair[1]]
    end

    def s_to_hash(string)
      string.split.map { |str| s_to_arr(str) }.to_h
    end

    def pass_valid?(pass)
      return false unless REQUIRED.all? { |key| pass.keys.include?(key) }
      return false unless pass[:byr].to_i >= 1920 && pass[:byr].to_i <= 2002
      return false unless pass[:iyr].to_i >= 2010 && pass[:iyr].to_i <= 2020
      return false unless pass[:eyr].to_i >= 2020 && pass[:eyr].to_i <= 2030
      return false unless %w[amb blu brn gry grn hzl oth].include?(pass[:ecl])
      return false unless hgt_valid(pass[:hgt])
      return false unless pass[:hcl].match?(/\A\#[a-f0-9]{6}\Z/)
      return false unless pass[:pid].match?(/\A[0-9]{9}\Z/)

      true
    end

    def hgt_valid(code)
      (code.match?(/\A\d+cm\Z/) && code.gsub('cm', '').to_i >= 150 && code.gsub('cm', '').to_i <= 193) ||
        (code.match?(/\A\d+in\Z/) && code.gsub('in', '').to_i >= 59 && code.gsub('cm', '').to_i <= 76)
    end

    def str_pass_valid?(str)
      pass_valid?(s_to_hash(str))
    end

    REQUIRED = %i[byr
                  iyr
                  eyr
                  hgt
                  hcl
                  ecl
                  pid].freeze
    OPTIONAL = %i[cid].freeze
  end
end
