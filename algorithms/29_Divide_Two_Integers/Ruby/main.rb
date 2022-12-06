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
  s = a.to_s
  t = b.to_s
  w = ''
  i = 0
  r = 0
  while i <= s.size
    j = t.size
    p = (r.to_s + s.slice(i, j)).to_i
    if (p - b) < 0
      if i == 0
        j += 1
        p = (r.to_s + s.slice(i, j)).to_i
      elsif i == s.size
        break
      end
    end

    q = 0
    r = p
    while r >= b
      r -= b
      q += 1
    end
    w += q.to_s
    i += j
  end

  v = w.to_i
  v = -v if (dividend < 0 || divisor < 0) && !(dividend < 0 && divisor < 0)

  v
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
