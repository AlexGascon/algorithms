# frozen_string_literal: true

require './lib/problems/h_plus_minus'

RSpec.describe PlusMinusCalculator do
  describe 'ratios_for' do
    it 'returns the correct ratios' do
      a1 = [-1, -2, 0, 1, 2]
      a2 = [1, 2, 3, 4, 5]
      a3 = [-1, -2, -3, -4, -5]
      a4 = [0, 0, 0, 0, 0]

      expect(PlusMinusCalculator.ratios_for(a1)).to eq([0.4, 0.4, 0.2])
      expect(PlusMinusCalculator.ratios_for(a2)).to eq([1.0, 0.0, 0.0])
      expect(PlusMinusCalculator.ratios_for(a3)).to eq([0.0, 1.0, 0.0])
      expect(PlusMinusCalculator.ratios_for(a4)).to eq([0.0, 0.0, 1.0])
    end
  end
end
