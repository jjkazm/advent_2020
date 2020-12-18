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
      string.split(':')
    end

    def s_to_hash(string)
      string.split.map { |str| s_to_arr(str) }.to_h
    end

    def pass_valid?(pass)
      return false unless REQUIRED.all? { |key| pass.keys.include?(key) }
      return false unless pass[:byr].to_i >= 1920 && pass[:byr].to_i <= 2002
      return false unless pass[:iyr].to_i >= 2010 && pass[:iyr].to_i <= 2020
      return false unless pass[:iyr].to_i >= 2020 && pass[:iyr].to_i <= 2030
      return false unless hgt_valid(pass[:hgt])

      true
    end

    def hgt_valid(code); end

    def str_pass_valid?(str)
      pass_valid?(s_to_hash(str))
    end

    REQUIRED = %w[byr
                  iyr
                  eyr
                  hgt
                  hcl
                  ecl
                  pid].freeze
    OPTIONAL = %w[cid].freeze
   end
end
