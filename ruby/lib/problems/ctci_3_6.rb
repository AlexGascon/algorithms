# frozen_string_literal: true

# 3.6. Animal Shelter
# An animal shelter, which holds only dogs and cats, operates on a strictly
# "first in, first out" basis. People must adpot either the "oldest" (based on)
# arrival time) of all animals, or they can select whether they would prefer a
# dog or a cat (and they will receive the oldest animal of that type). Create
# the data structures to maintain this system and implement operations such as
# enqueue, dequeueAny, dequeueDog and dequeueCat. You may use the built-in
# LinkedList data structure

class AnimalShelter
  def initialize
    @animals_queue = DataQueue.new
    @cat_queue = DataQueue.new
    @dog_queue = DataQueue.new
  end

  def enqueue(animal)
    animals_queue.enqueue(animal)
  end

  def dequeue_any
    return cat_queue.dequeue unless cat_queue.empty?
    return dog_queue.dequeue unless dog_queue.empty?

    animals_queue.dequeue
  end

  def dequeue_cat
    return cat_queue.dequeue unless cat_queue.empty?
    
    until (animals_queue.peek.class == Cat) || animals_queue.empty?
      dog_queue.enqueue(animals_queue.dequeue)
    end

    animals_queue.dequeue
  end

  def dequeue_dog
    return dog_queue.dequeue unless dog_queue.empty?

    until animals_queue.peek.class == Dog || animals_queue.empty?
      cat_queue.enqueue(animals_queue.dequeue)
    end

    animals_queue.dequeue
  end

  private

  attr_reader :animals_queue, :cat_queue, :dog_queue
end

class Cat
end

class Dog
end