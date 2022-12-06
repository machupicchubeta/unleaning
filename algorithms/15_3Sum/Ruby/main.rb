# frozen_string_literal: true

# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  nums = nums.sort
  size = nums.size
  i = 0
  result = []
  while i < size - 2
    break if nums[i] > 0
    if i > 0 && nums[i-1] == nums[i]
      i += 1
      next
    end
    j = i + 1
    k = size - 1
    while j < k
      if nums[i] + nums[j] + nums[k] == 0
        result << [nums[i], nums[j], nums[k]]
        j += 1
        while j < k && nums[j-1] == nums[j]
          j += 1
        end
      elsif nums[i] + nums[j] + nums[k] < 0
        j += 1
      else
        k -= 1
      end
    end
    i += 1
  end

  result
end

require "minitest/autorun"

describe '#three_sum' do
  describe 'example 1' do
    it 'must_equal' do
      _(three_sum [-1,0,1,2,-1,-4]).must_equal [[-1,-1,2],[-1,0,1]]
    end
  end

  describe 'example 2' do
    it 'must_equal' do
      _(three_sum [0,1,1]).must_equal []
    end
  end

  describe 'example 3' do
    it 'must_equal' do
      _(three_sum [0,0,0]).must_equal [[0,0,0]]
    end
  end

  describe 'example 4' do
    it 'must_equal' do
      _(three_sum [-4,-2,-2,-2,0,1,2,2,2,3,3,4,4,6,6]).must_equal [[-4,-2,6],[-4,0,4],[-4,1,3],[-4,2,2],[-2,-2,4],[-2,0,2]]
    end
  end
end
