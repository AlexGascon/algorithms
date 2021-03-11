# frozen_string_literal: true

# 4.5. Validate BST
# Implement a function to check if a binary tree is a binary search tree

require './lib/data_structures/binary_tree'

# MonkeyPatching the class to implement the function as a method

class BinaryTree
  def bst?
    dfs == dfs.sort
  end
end

RSpec.describe BinaryTree do
  describe 'bst?' do
    it 'returns true if the tree is a binary search tree' do
      left_left = BinaryTree.new(2)
      left_right = BinaryTree.new(7)
      right_left = BinaryTree.new(13)
      right_right = BinaryTree.new(20) 

      left = BinaryTree.new(5, left_left, left_right)
      right = BinaryTree.new(18, right_left, right_right)
      root = BinaryTree.new(10, left, right)

      expect(root).to be_bst
    end

    it 'returns false if the tree is not a binary search tree' do
      left_left = BinaryTree.new(2)
      left_right = BinaryTree.new(11)
      right_left = BinaryTree.new(13)
      right_right = BinaryTree.new(20) 

      left = BinaryTree.new(5, left_left, left_right)
      right = BinaryTree.new(18, right_left, right_right)
      root = BinaryTree.new(10, left, right)

      expect(root).not_to be_bst
    end
  end
end
