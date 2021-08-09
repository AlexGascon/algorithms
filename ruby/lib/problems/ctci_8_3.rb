# Magic index
# A magic index in an array A[1...n-1] is defined to be an index such that
# A[i] = i. Given a sorted array of distinct integers, write a method to find
# a magic index, if one exists, in array A

class MagicIndexFinder
  def self.has_magic_index?(array)
    has_magic_index_recursive?(array)
  end

  private

  def self.has_magic_index_recursive?(array, offset=0)
    return false if array.empty?

    middle_element = array.length / 2

    value = array[middle_element]
    left_half = array[0, middle_element]
    right_half = array[middle_element+1, array.length]

    if value == (middle_element + offset)
      return true
    elsif array[middle_element] > (middle_element + offset)
      return self.has_magic_index_recursive?(left_half, 0)
    else  
      return self.has_magic_index_recursive?(right_half, middle_element + 1)
    end
  end

  def self.has_magic_index_iterative?(array)
    array.each_with_index do |val, i|
      return true if val == i
    end

    false
  end
end
