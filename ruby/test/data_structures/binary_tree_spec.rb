# frozen_string_literal: true

require_relative '../../lib/data_structures/binary_tree'

RSpec.describe BinaryTree do
  before do
    left_left = BinaryTree.new(2)
    left_right = BinaryTree.new(7)
    right_left = BinaryTree.new(13)
    right_right = BinaryTree.new(20) 

    left = BinaryTree.new(5, left_left, left_right)
    right = BinaryTree.new(18, right_left, right_right)
    root = BinaryTree.new(10, left, right)

    @tree = root
  end

  describe 'dfs' do
    it 'returns the values in depth-first in-order order' do
      expected_order = [2, 5, 7, 10, 13, 18, 20]

      expect(@tree.dfs).to eq expected_order
    end
  end

  describe 'bfs' do
    it 'returns the values in breadth-first order' do
      expected_order = [10, 5, 18, 2, 7, 13, 20]

      expect(@tree.bfs).to eq expected_order
    end
  end
end
