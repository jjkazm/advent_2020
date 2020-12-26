# frozen_string_literal: true

require_relative './two.rb'

describe Solution do
  include Solution
  describe 'count_all' do
    let(:two_people) { 'a ab' }

    it { expect(count_all(two_people)).to eq 1 }

    let(:three_people) { 'ab ab abc ' }

    it { expect(count_all(three_people)).to eq 2 }
  end
end
