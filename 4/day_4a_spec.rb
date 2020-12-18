# frozen_string_literal: true

require_relative './day_4a.rb'

describe Solution do
  subject(:instance) { described_class.new('./isample.txt') }

  describe 's_to_hash' do
    it { expect(instance.s_to_hash('aa:2 bb:3')).to eq('aa' => '2', 'bb' => '3') }
  end

  describe '.str_pass_valid?' do
    let(:valid) do
      'ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
      byr:1937 iyr:2017 cid:147 hgt:183cm'
    end

    it { expect(instance.str_pass_valid?(valid)).to be true }

    let(:invalid) { "iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
      hcl:#cfa07d byr:1929"}
    
      it { expect(instance.str_pass_valid?(invalid)).to be false }

  end
end
