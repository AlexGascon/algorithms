# frozen_string_literal: true

require './lib/data_structures/linked_hashed_list.rb'

class Cache
  EXPIRATION_TYPE_LRU = :lru
  EXPIRATION_TYPES = %i[lru]

  attr_reader :max_size

  def initialize(max_size=5)
    @cache = {}
    @max_size = max_size
    @expiration_type = EXPIRATION_TYPE_LRU
    @elements_to_expire = LinkedHashedList.new
  end

  def put(key, value)
    execute_expiration if (full? && new_element?(key))

    refresh_expiration_position(key)

    cache[key] = value
  end

  def get(key)
    refresh_expiration_position(key)

    cache[key]
  end

  def size
    cache.size
  end

  private

  attr_reader :cache, :expiration_type, :elements_to_expire

  def full?
    cache.size == max_size
  end

  def new_element?(key)
    !cache.key?(key)
  end

  def refresh_expiration_position(key)
    return @elements_to_expire.add(key) if new_element?(key)
    @elements_to_expire.move_to_end(key)
  end

  def execute_expiration
    element_to_expire = @elements_to_expire.head

    cache.delete(element_to_expire.value)
    elements_to_expire.remove(element_to_expire.value)
  end
end
