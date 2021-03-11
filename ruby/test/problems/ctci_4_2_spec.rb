# frozen_string_literal: true

require './lib/problems/ctci_4_2'

RSpec.describe BSTBuilder do
  describe 'create_bst_from' do
    it 'works when the array can create a perfect tree' do
      left_left = BinaryTree.new(2)
      left_right = BinaryTree.new(7)
      right_left = BinaryTree.new(13)
      right_right = BinaryTree.new(20) 
      left = BinaryTree.new(5, left_left, left_right)
      right = BinaryTree.new(18, right_left, right_right)
      expected_tree = BinaryTree.new(10, left, right)

      elements = [2, 5, 7, 10, 13, 18, 20]
      expect(BSTBuilder.create_bst_from(elements)).to eq expected_tree
    end

    it 'works when the array has more numbers on the left' do
      left_left = BinaryTree.new(2)
      left_right = BinaryTree.new(7)
      right_left = BinaryTree.new(13)
      left = BinaryTree.new(5, left_left, left_right)
      right = BinaryTree.new(18, right_left, nil)
      expected_tree = BinaryTree.new(10, left, right)

      elements = [2, 5, 7, 10, 13, 18]
      expect(BSTBuilder.create_bst_from(elements)).to eq expected_tree
    end
  end
end
