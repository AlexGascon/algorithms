# frozen_string_literal: true

require './lib/problems/ctci_3_2'

RSpec.describe StackWithMin do
  it 'returns the minimum element at any time' do
    stack = StackWithMin.new

    expect(stack.min).to be_nil

    stack.push 42
    expect(stack.min).to eq 42

    stack.push 23
    expect(stack.min).to eq 23

    stack.push 33
    expect(stack.min).to eq 23

    stack.pop
    expect(stack.min).to eq 23
    
    stack.pop
    expect(stack.min).to eq 42
  end

  it 'returns the min correctly when it was repeated' do
    stack = StackWithMin.new

    expect(stack.min).to be_nil

    stack.push 42 # [42]
    expect(stack.min).to eq 42

    stack.push 23 # [42, 23]
    expect(stack.min).to eq 23

    stack.push 23 # [42, 23, 23]
    expect(stack.min).to eq 23

    stack.pop # [42, 23]
    expect(stack.min).to eq 23

    stack.pop # [42]
    expect(stack.min).to eq 42
  end
end
