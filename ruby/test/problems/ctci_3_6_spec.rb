# frozen_string_literal: true

require './lib/problems/ctci_3_6'

RSpec.describe AnimalShelter do
  let(:shelter) { described_class.new }
  describe 'dequeue_any' do
    it 'returns the oldest cat even after a dequeue_dog' do
      first_cat = Cat.new
      shelter.enqueue(first_cat)
      shelter.enqueue(Cat.new)
      shelter.enqueue(Cat.new)
      shelter.enqueue(Cat.new)
      shelter.enqueue(Cat.new)
      shelter.enqueue(Cat.new)
      shelter.enqueue(Dog.new)

      shelter.dequeue_dog

      expect(shelter.dequeue_any).to eq first_cat
    end

    it 'returns the oldest dog even after a dequeue_cat' do
      first_dog = Dog.new
      shelter.enqueue(first_dog)
      shelter.enqueue(Dog.new)
      shelter.enqueue(Dog.new)
      shelter.enqueue(Dog.new)
      shelter.enqueue(Dog.new)
      shelter.enqueue(Dog.new)
      shelter.enqueue(Cat.new)

      shelter.dequeue_cat

      expect(shelter.dequeue_any).to eq first_dog
    end

    it 'returns the oldest dog even after a dequeue_cat and a new enqueued Dog' do
      first_dog = Dog.new
      shelter.enqueue(first_dog)
      shelter.enqueue(Dog.new)
      shelter.enqueue(Dog.new)
      shelter.enqueue(Dog.new)
      shelter.enqueue(Dog.new)
      shelter.enqueue(Dog.new)
      shelter.enqueue(Cat.new)

      shelter.dequeue_cat
      shelter.enqueue(Dog.new)

      expect(shelter.dequeue_any).to eq first_dog
    end
  end

  describe 'dequeue_cat' do
    it 'returns nil if there are no cats' do
      shelter.enqueue(Dog.new)
      shelter.enqueue(Dog.new)
      shelter.enqueue(Dog.new)
      shelter.enqueue(Dog.new)

      expect(shelter.dequeue_cat).to be_nil
    end
  end

  describe 'dequeue_dog' do
    it 'returns nil if there are no dogs' do
      shelter.enqueue(Cat.new)
      shelter.enqueue(Cat.new)
      shelter.enqueue(Cat.new)
      shelter.enqueue(Cat.new)
      shelter.enqueue(Cat.new)

      expect(shelter.dequeue_dog).to be_nil
    end
  end
end