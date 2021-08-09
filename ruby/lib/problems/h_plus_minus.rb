# Plus Minus
# Given an array of integers, calculate the ratios of its elements that are positive, negative, and zero
# Print the decimal value of each fraction on a new line with places after the decimal.
# https://www.hackerrank.com/challenges/one-week-preparation-kit-plus-minus/problem

class PlusMinusCalculator
  def self.ratios_for(array)
    count = {
      positive: 0,
      negative: 0,
      zero: 0
    }

    array.each do |number|
      count[:positive] = count[:positive] + 1 if number > 0
      count[:negative] = count[:negative] + 1 if number < 0
      count[:zero] = count[:zero] + 1 if number == 0
    end

    ratios = count.map { |_type, elem_count| elem_count.to_f / array.length }
  end
end
