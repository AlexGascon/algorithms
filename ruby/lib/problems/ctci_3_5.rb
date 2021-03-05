# frozen_string_literal: true

# 3.5. Sort Stack
# Write a program to sort a stack such that the smallest items are on the top
# You can use an additional temporary stack, but you may not copy the elements
# into any other data structure (such as an array). The stack supports the
# following operations: push, pop, peek, and empty?

require_relative '../data_structures/stack'

class StackSorter
  def initialize(stack)
    @stack = stack
    @sorted_stack = Stack.new
  end

  def sort!
    sorted_stack.push(stack.pop)

    while !stack.empty? do
      current_element = stack.pop

      while (!sorted_stack.empty? && current_element > sorted_stack.peek)
        stack.push(sorted_stack.pop)
      end

      sorted_stack.push(current_element)
    end

    sorted_stack
  end

  private

  attr_reader :stack, :sorted_stack
end
