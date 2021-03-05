# frozen_string_literal: true

# 3.4 Queue via Stacks
# Implement a MyQueue class which implements a queue using two stacks

require_relative '../data_structures/stack'

class MyQueue
  def initialize
    @main_stack = Stack.new
    @support_stack = Stack.new
  end

  def enqueue(value)
    main_stack.push(value)
  end

  def dequeue
    while !main_stack.empty?
      support_stack.push(main_stack.pop)
    end

    value = support_stack.pop

    while !support_stack.empty?
      main_stack.push(support_stack.pop)
    end

    value
  end

  def empty?
    main_stack.empty?
  end

  def peek
    while !main_stack.empty?
      support_stack.push(main_stack.pop)
    end

    value = support_stack.peek

    while !support_stack.empty?
      main_stack.push(support_stack.pop)
    end

    value
  end

  private

  attr_accessor :main_stack, :support_stack
end