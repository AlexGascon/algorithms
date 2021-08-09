# Mini-Max Sum
# Given five positive integers, find the minimum and maximum values that can be
# calculated by summing exactly four of the five integers. Then print the
# respective minimum and maximum values as a single line of two space-separated
# long integers
# https://www.hackerrank.com/challenges/one-week-preparation-kit-mini-max-sum/problem

class MiniMaxSumCalculator
  def self.mini_max_for(array)
    sorted_array = array.sort

    total_sum = sorted_array.sum
    min = total_sum - sorted_array[4]
    max = total_sum - sorted_array[0]

    [min, max]
  end
end
