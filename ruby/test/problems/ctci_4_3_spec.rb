# frozen_string_literal: true

require './lib/problems/ctci_4_3'

RSpec.describe ListOfDepthsBuilder do
  describe '.create_lists_of_depth' do
    it 'works with a tree without children' do
      simple_tree = BinaryTree.new(1)

      result = ListOfDepthsBuilder.create_lists_of_depth(simple_tree)
      expect(result.size).to eq 1

      first_list = result.first
      expect(first_list.value).to eq 1
      expect(first_list.next_node).to be_nil
    end

    it 'creates one list per each tree level' do
      tall_tree = BinaryTree.new(1, BinaryTree.new(2, BinaryTree.new(3, BinaryTree.new(4))))
      result = ListOfDepthsBuilder.create_lists_of_depth(tall_tree)
      expect(result.size).to eq 4

      left = BinaryTree.new(2, BinaryTree.new(4), BinaryTree.new(5))
      right = BinaryTree.new(3, BinaryTree.new(6), BinaryTree.new(7))
      wide_tree = BinaryTree.new(1, left, right)
      result = ListOfDepthsBuilder.create_lists_of_depth(wide_tree)
      expect(result.size).to eq 3
    end

    it 'creates lists with the correct content' do
      tall_tree = BinaryTree.new(1, BinaryTree.new(2, BinaryTree.new(3, BinaryTree.new(4))))
      result = ListOfDepthsBuilder.create_lists_of_depth(tall_tree)
      expect(result.first).to eq Node.new(1)
      expect(result[1]).to eq Node.new(2)
      expect(result[2]).to eq Node.new(3)
      expect(result[3]).to eq Node.new(4)

      left = BinaryTree.new(2, BinaryTree.new(4), BinaryTree.new(5))
      right = BinaryTree.new(3, BinaryTree.new(6), BinaryTree.new(7))
      wide_tree = BinaryTree.new(1, left, right)
      result = ListOfDepthsBuilder.create_lists_of_depth(wide_tree)
      expect(result.first).to eq Node.new(1)
      expect(result[1]).to eq Node.new(2, Node.new(3))
      expect(result[2]).to eq Node.new(4, Node.new(5, Node.new(6, Node.new(7))))
    end

  end
end
