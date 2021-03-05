# frozen_string_literal: true

require './lib/problems/ctci_3_5'

RSpec.describe StackSorter do
  it 'sorts a stack' do
    stack = Stack.new
    stack.push 99
    stack.push 23
    stack.push 42
    stack.push 11

    sorted_stack = StackSorter.new(stack).sort!

    expect(sorted_stack.pop).to eq 11
    expect(sorted_stack.pop).to eq 23
    expect(sorted_stack.pop).to eq 42
    expect(sorted_stack.pop).to eq 99
  end
end
