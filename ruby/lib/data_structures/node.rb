# frozen_string_literal: true

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end

  def ==(other)
    return false if other.nil?

    (value == other&.value) && (next_node == other.next_node)
  end

  def to_s
    "Node(#{value}, #{next_node})"
  end
end