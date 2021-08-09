require 'pry'
# 8.1. Triple step
# A child is running up a staircase with n steps and can hop either 1 step,
# 2 steps or 3 steps at a time. Implement a method to count how many possible
# ways the child can run up the stairs


class StaircasePathCalculator
  def self.for(steps)
    self.for_memoized(steps, {0 => 1, 1 => 1, 2 => 2})
  end

  private

  def self.for_memoized(steps, memory)
    return memory[steps] if memory.key?(steps)
    return 0 if steps < 0

    result = self.for_memoized(steps - 1, memory) +
      self.for_memoized(steps - 2, memory) +
      self.for_memoized(steps - 3, memory)

    memory[steps] = result

    result
  end
end