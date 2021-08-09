require './lib/problems/ctci_8_1'

RSpec.describe StaircasePathCalculator do
  describe '.for' do
    it 'returns 1 for a staircase with 1 step' do
      expect(StaircasePathCalculator.for(1)).to eq 1
    end

    it 'returns 2 for a staircase with 2 steps' do
      expect(StaircasePathCalculator.for(2)).to eq 2
    end

    it 'returns 4 for a staircase with 3 steps' do
      expect(StaircasePathCalculator.for(3)).to eq 4
    end

    it 'returns 7 for a staircase with 4 steps' do
      expect(StaircasePathCalculator.for(4)).to eq 7
    end

    it 'returns 13 for a staircase with 5 steps' do
      expect(StaircasePathCalculator.for(5)).to eq 13
    end

    it 'returns 1 for a staircase with 0 steps' do
      expect(StaircasePathCalculator.for(0)).to eq 1
    end

    it 'returns 0 for a staircase with a negative number of steps' do
      expect(StaircasePathCalculator.for(-1)).to eq 0
    end
  end
end