# frozen_string_literal: true

# @param {String} s
# @return {Integer}
def my_atoi(s)
  /[ ]*([+-]?)([0-9]*).*/ =~ s
  return 0 if $2 == ''

  negative = true if $1 == '-'
  t = $2.to_i
  t = -t if negative
  if t < -2**31
    t = -2**31
  elsif t > (2**31 - 1)
    t = 2**31 - 1
  end

  t
end

require "minitest/autorun"

describe '#my_atoi' do
  describe 'example 1' do
    it 'must_equal' do
      _(my_atoi "42").must_equal 42
    end
  end

  describe 'example 2' do
    it 'must_equal' do
      _(my_atoi "   -42").must_equal -42
    end
  end

  describe 'example 3' do
    it 'must_equal' do
      _(my_atoi "4193 with words").must_equal 4193
    end
  end

  describe 'example 4' do
    it 'must_equal' do
      _(my_atoi ".1").must_equal 0
    end
  end
end
