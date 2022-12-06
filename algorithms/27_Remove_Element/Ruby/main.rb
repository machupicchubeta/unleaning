# frozen_string_literal: true

# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
  nums.delete val
  nums.size
end

require "minitest/autorun"

describe '#remove_element' do
  describe 'example 1' do
    it 'must_equal' do
      _(remove_element [3,2,2,3], 3).must_equal 2
    end
  end

  describe 'example 2' do
    it 'must_equal' do
      _(remove_element [0,1,2,2,3,0,4,2], 2).must_equal 5
    end
  end
end
