# frozen_string_literal: true

require './lib/problems/h_mini_max_sum'

RSpec.describe MiniMaxSumCalculator do
  describe 'mini_max_for' do
    it 'works as expected' do
      array = [1, 3, 5, 7, 9]
      expect(MiniMaxSumCalculator.mini_max_for(array)).to eq [16, 24]
    end
  end
end