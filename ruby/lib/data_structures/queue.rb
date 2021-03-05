# frozen_string_literal: true

require_relative './node'

# We can't use Queue as it's a Ruby class: https://ruby-doc.org/core-2.5.0/Queue.html
# and Ruby acts it as if we were trying to monkeypatch
class DataQueue
  def initialize
    @first_element = nil
  end

  def enqueue(value)
    value_node = Node.new(value, @first_element)
    @first_element = value_node
  end

  def dequeue
    return if empty?

    if only_one_element?
      element = @first_element
      @first_element = nil

      return element.value
    end

    last, second_to_last = last_and_second_to_last_elements

    second_to_last.next_node = nil
    last.value
  end

  def peek
    return if empty?

    last, _ = last_and_second_to_last_elements

    last.value
  end

  def empty?
    @first_element.nil?
  end

  private

  def last_and_second_to_last_elements
    current_element = @first_element

    until current_element.next_node.nil?
      previous_element = current_element
      current_element = current_element.next_node
    end

    [current_element, previous_element]
  end

  def only_one_element?
    @first_element.next_node == nil
  end
end
