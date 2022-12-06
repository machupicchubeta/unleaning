# frozen_string_literal: true

# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  nums.uniq!
  nums.size
end

require "minitest/autorun"

describe '#remove_duplicates' do
  describe 'example 1' do
    it 'must_equal' do
      _(remove_duplicates [1,1,2]).must_equal 2
    end
  end

  describe 'example 2' do
    it 'must_equal' do
      _(remove_duplicates [0,0,1,1,1,2,2,3,3,4]).must_equal 5
    end
  end
end
