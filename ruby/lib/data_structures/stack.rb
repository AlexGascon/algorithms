# frozen_string_literal: true

class Stack
  def initialize
    @elements = []
  end

  def push(element)
    elements.append(element)
  end

  def pop
    return if empty?

    last_index = size - 1
    elements.delete_at(last_index)
  end

  def peek
    elements.last
  end

  def size
    elements.size
  end

  def empty?
    elements.size == 0
  end

  private

  attr_accessor :elements
end