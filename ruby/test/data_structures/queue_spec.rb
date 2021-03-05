# frozen_string_literal: true

require_relative '../../lib/data_structures/queue'

RSpec.describe DataQueue do
  subject(:queue) { DataQueue.new }

  describe 'enqueue' do
    it 'adds a new element to the queue' do
      queue.enqueue(42)

      expect(queue.peek).to eq 42
    end
  end

  describe 'dequeue' do
    it 'returns the oldest element in the queue' do
      queue.enqueue 42
      queue.enqueue 23

      expect(queue.dequeue).to eq 42
    end

    it 'removes the element from the queue' do
      queue.enqueue 42
      queue.enqueue 23

      expect(queue.dequeue).to eq 42
      expect(queue.peek).not_to eq 42
    end

    it 'returns nil if the queue is empty' do
      expect(queue.dequeue).to be_nil
    end
  end

  describe 'peek' do
    it 'returns the oldest element in the queue' do
      queue.enqueue 42
      queue.enqueue 23

      expect(queue.peek).to eq 42
    end

    it 'does not change the queue' do
      queue.enqueue 42
      queue.enqueue 23

      expect(queue.peek).to eq queue.peek
    end

    it 'returns nil if the queue is empty' do
      expect(queue.peek).to be_nil
    end
  end

  describe 'empty?' do
    it 'returns true if the queue is empty' do
      expect(queue.empty?).to be true
    end

    it 'returns false if there are elements in the queue' do
      queue.enqueue 99
      expect(queue.empty?).to be false
    end

    it 'returns true if the queue is filled and emptied' do
      queue.enqueue 99
      queue.dequeue
      
      expect(queue.empty?).to be true
    end
  end
end
