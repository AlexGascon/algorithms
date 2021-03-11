# frozen_string_literal: true

# 4.2. Minimal Tree
# Given a sorted (increasing order) array with unique integer elements,
# write an algorithm to create a binary search tree with minimal height

require './lib/data_structures/binary_tree'

class BSTBuilder
  def self.create_bst_from(array)
    return if array.empty?
    return BinaryTree.new(array.first) if array.size == 1

    if array.size % 2 == 1
      middle_element_position = (array.size - 1)/2
      left_array = array[0..(middle_element_position - 1)]
      right_array = array[(middle_element_position + 1)..-1]
    else
      middle_element_position = array.size/2
      left_array = array[0..(middle_element_position - 1)]
      right_array = array[(middle_element_position + 1)..-1]
    end

    middle = array[middle_element_position]
    root = BinaryTree.new(middle)

    left = BSTBuilder.create_bst_from(left_array)
    root.left = left

    right = BSTBuilder.create_bst_from(right_array)
    root.right = right

    root
  end
end
