require './lib/problems/ctci_8_3'

RSpec.describe MagicIndexFinder do
  describe '.has_magic_index?' do
    it 'returns true if the array has a magic index' do
      a1 = [0, 2, 3, 4, 5]
      a2 = [-1, 0, 1, 2, 4]
      a3 = [-1, 0, 1, 3]
      a4 = [-1, 1, 2, 4]
      a5 = [-1, 0, 2, 66, 8193]

      expect(MagicIndexFinder.has_magic_index?(a1)).to be true
      expect(MagicIndexFinder.has_magic_index?(a2)).to be true
      expect(MagicIndexFinder.has_magic_index?(a3)).to be true
      expect(MagicIndexFinder.has_magic_index?(a4)).to be true
      expect(MagicIndexFinder.has_magic_index?(a5)).to be true
    end

    it 'returns false if the array does not have a magic index' do
      a1 = [1, 2, 3, 4, 5]
      a2 = [-1, 0, 1, 2, 3]
      a3 = [-1, 0, 1, 66, 8193]

      expect(MagicIndexFinder.has_magic_index?(a1)).to be false
      expect(MagicIndexFinder.has_magic_index?(a2)).to be false
      expect(MagicIndexFinder.has_magic_index?(a3)).to be false
    end
  end
end
