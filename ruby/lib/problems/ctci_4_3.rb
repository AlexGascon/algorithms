# frozen_string_literal: true

# 4.3. List of Depths
# Given a binary tree, design an algorithm which creates a linked list of all
# the nodes at nodes at each depth

class ListOfDepthsBuilder
  def self.create_lists_of_depth(binary_tree)
    map_of_lists = self.lists_for_tree(binary_tree, 0, {})

    map_of_lists.keys.sort.map do |key|
      map_of_lists[key]
    end
  end

  private

  def self.lists_for_tree(binary_tree, current_level, current_lists)
    return current_lists if binary_tree.nil?

    if current_lists[current_level].nil?
      current_lists[current_level] = Node.new(binary_tree.value)
    else
      current_node = current_lists[current_level]

      until current_node.next_node.nil?
        current_node = current_node.next_node
      end

      current_node.next_node = Node.new(binary_tree.value)
    end

    current_lists = self.lists_for_tree(binary_tree.left, current_level+1, current_lists)
    current_lists = self.lists_for_tree(binary_tree.right, current_level+1, current_lists)

    current_lists
  end
end
