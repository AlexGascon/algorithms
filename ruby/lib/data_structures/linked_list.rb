# frozen_string_literal: true

require './lib/data_structures/node'

class LinkedList
  attr_reader :first

  def initialize
    @first = nil
  end

  # Revisar esto porque en realidad lo que me he montado es una cola, no una LinkedList.
  # En una LinkedList puedes meter las cosas donde quieras
  def add(element)
    new_node = Node.new(element)

    if first.nil?
      @first = new_node
    else
      last.next_node = new_node
    end
  end

  def last
    return if first.nil?

    current = first
    while !current.next_node.nil? do
      current = current.next_node
    end

    current
  end
end
