# frozen_string_literal: true

# @param {Integer} x
# @return {Integer}
def reverse(x)
  y = x.abs.to_s.reverse.to_i
  y = -y if x < 0
  y = 0 if y < -2**31 || (2**31 - 1) < y

  y
end

require "minitest/autorun"

describe '#reverse' do
  describe 'example 1' do
    it 'must_equal' do
      _(reverse 123).must_equal 321
    end
  end

  describe 'example 2' do
    it 'must_equal' do
      _(reverse -123).must_equal -321
    end
  end

  describe 'example 3' do
    it 'must_equal' do
      _(reverse 120).must_equal 21
    end
  end
end
