# frozen_string_literal: true

# 3.2. Stack Min
# How would you design a Stack which, in addition to push and pop, has a function
# that returns the minimum element? Push, pop and min should all operate in O(1) time

class StackWithMin
  def initialize
    @elements = []
    @minimums = []
  end

  def push(element)
    elements.append(element)

    if add_minimum?(element)
      minimums.append(element)
    end
  end

  def pop
    return if empty?

    last_index = size - 1
    popped_element = elements.delete_at(last_index)

    if remove_minimum?(popped_element)
      last_minimum_index = minimums.size - 1
      minimums.delete_at(last_minimum_index)
    end
  end

  def min
    minimums.last
  end

  def empty?
    size == 0
  end

  def size
    elements.size
  end

  private

  attr_accessor :elements, :minimums

  def add_minimum?(element)
    minimums.empty? || element <= minimums.last
  end

  def remove_minimum?(element)
    minimums.last == element
  end
end
