# frozen_string_literal: true

require './lib/data_structures/double_linked_node.rb'

class LinkedHashedList
  attr_accessor :head, :tail, :elements

  def initialize
    @head = nil
    @tail = nil
    @elements = {}
  end

  def add(value)
    return false if elements.key?(value)

    node = DoubleLinkedNode.new(value)
    elements[value] = node

    if head.nil?
      self.head = self.tail = node
    else
      old_tail = tail
      old_tail.next_node = node
      node.previous_node = old_tail
      self.tail = node
    end

    true
  end

  def remove(value)
    return false unless elements.key?(value)

    if head.value == value
      self.head = head.next_node
    elsif tail.value == value
      self.tail = tail.previous_node
    else
      node = elements[value]
      node.previous_node = node.next_node
    end

    elements.delete(value)

    true
  end

  def move_to_end(value)
    remove(value) && add(value)
  end
end
