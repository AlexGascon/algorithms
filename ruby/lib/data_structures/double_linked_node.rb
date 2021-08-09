# frozen_string_literal: true

require './lib/data_structures/node'

class DoubleLinkedNode < Node
  attr_accessor :previous_node

  def initialize(value, next_node=nil, previous_node=nil)
    super(value, next_node)
    @previous_node = previous_node
  end

  # Compares a node with another
  # Returns false only if value, next_node and previous_node are not empty and match
  def ==(other)
    return false unless other.is_a?(DoubleLinkedNode)
    return false if other.nil?

    (other.value == value &&
      other.next_node == next_node &&
      other.previous_node == previous_node)
  end

  def to_s
    "DoubleLinkedNode(#{value}, next=#{next_node}, previous=#{previous_node})"
  end
end
