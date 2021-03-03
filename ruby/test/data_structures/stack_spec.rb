# frozen_string_literal: true

require_relative '../../lib/data_structures/stack'

RSpec.describe Stack do
  subject(:stack) { Stack.new }

  describe 'push' do
    it 'sets the element on top' do
      stack.push(42)      

      expect(stack.peek).to eq 42
    end

    it 'increases the stack size' do
      expect { stack.push('something') }.to change { stack.size }.by(1)
    end
  end

  describe 'pop' do
    it 'returns the last element pushed' do
      stack.push 32

      expect(stack.pop).to eq 32
    end

    it 'decreases the stack size' do
      stack.push 42
      stack.push 55

      expect { stack.pop }.to change { stack.size }.by -1
    end

    it 'returns nil when the stack is empty' do
      expect(stack.pop).to be_nil
      expect(Stack.new.pop).to be_nil
    end
  end

  describe 'peek' do
    it 'returns the element on top' do
      stack.push(1)
      expect(stack.peek).to eq 1

      stack.push(23)
      expect(stack.peek).to eq 23
    end

    it 'does not change the size' do
      expect { stack.peek }.not_to change { stack.size }
    end

    it 'returns nil when the stack is empty' do
      expect(stack.peek).to be_nil
    end
  end

  describe 'empty?' do
    it 'returns true when the stack is empty' do
      expect(stack.empty?).to be true
    end

    it 'returns false when there are elements' do
      stack.push 22
      expect(stack.empty?).to be false
    end

    it 'returns true if we put elements and remove them' do
      stack.push 33
      stack.pop

      expect(stack.empty?).to be true
    end
  end

  describe 'size' do
    it 'returns the number of elements' do
      stack.push 23
      expect(stack.size).to eq 1

      stack.push 42
      expect(stack.size).to eq 2
      
      stack.push 23
      expect(stack.size).to eq 3
    end

    it 'returns 0 if the stack is empty' do
      expect(stack.size).to eq 0
      expect(Stack.new.size).to eq 0
    end
  end
end
