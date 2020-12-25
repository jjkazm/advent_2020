# frozen_string_literal: true

require_relative './day_4b.rb'

describe Solution do
  describe 's_to_hash' do
    it { expect(described_class.s_to_hash('aa:2 bb:3')).to eq(:aa => '2', :bb => '3') }
  end

  describe '.str_pass_valid?' do
    let(:valid) do
      'pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980 hcl:#623a2f'
    end

    it { expect(described_class.str_pass_valid?(valid)).to be true }

    let(:invalid) do
      'eyr:1972 cid:100 hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926'
    end

    it { expect(described_class.str_pass_valid?(invalid)).to be false }
  end
end
