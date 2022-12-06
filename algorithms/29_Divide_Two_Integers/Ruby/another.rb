# frozen_string_literal: true

# @param {Integer} dividend
# @param {Integer} divisor
# @return {Integer}
def divide(dividend, divisor)
  return 2147483647 if dividend == -2**31 && divisor == -1

  if dividend == 0
    return 0
  elsif divisor == 0
    raise ZeroDivisionError
  end

  a = dividend.abs
  b = divisor.abs

  count = 0
  while a >= b
    a -= b
    count += 1
  end

  if (dividend < 0 || divisor < 0) && !(dividend < 0 && divisor < 0)
    count = -count
  end

  count
end

require "minitest/autorun"

describe '#divide' do
  describe 'example 1' do
    it 'must_equal' do
      _(divide 10, 3).must_equal 3
    end
  end

  describe 'example 2' do
    it 'must_equal' do
      _(divide 7, -3).must_equal -2
    end
  end
end
