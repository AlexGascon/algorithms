# frozen_string_literal: true

require_relative './queue.rb'

class BinaryTree
  attr_accessor :value, :left, :right

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def dfs
    [
      *left&.dfs,
      value,
      *right&.dfs
    ].compact
  end

  def bfs
    elements_queue = DataQueue.new

    elements_queue.enqueue(self)

    elements = []
    while !elements_queue.empty?
      element = elements_queue.dequeue
      elements << element.value

      unless element.left.nil?
        elements_queue.enqueue(element.left)
      end

      unless element.right.nil?
        elements_queue.enqueue(element.right)
      end
    end

    elements
  end

  def ==(other)
    return false if other.nil?

    value == other&.value &&
    left == other&.left &&
    right == other&.right
  end

  def to_s
    "BinaryTree(#{value}, left=#{left}, right=#{right})"
  end
end
