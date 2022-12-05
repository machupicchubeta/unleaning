# frozen_string_literal: true

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  if strs.size == 0
    return ''
  elsif strs.size == 1
    return strs[0]
  end

  s = strs.sort_by { |w| w.size }
  return '' if s[0].size == 0

  t = ''
  latch = true
  i = 0
  j = 1
  while i < s[0].size
    t = s[0][i]
    j = 1
    while j < s.size
      if t != s[j][i]
        latch = false
        break
      end
      j += 1
    end
    break unless latch
    i += 1
  end

  s[0].slice 0, i
end

require "minitest/autorun"

describe '#longest_common_prefix' do
  describe 'example 1' do
    it 'must_equal' do
      _(longest_common_prefix ["flower","flow","flight"]).must_equal 'fl'
    end
  end

  describe 'example 2' do
    it 'must_equal' do
      _(longest_common_prefix ["dog","racecar","car"]).must_equal ''
    end
  end

  describe 'example 3' do
    it 'must_equal' do
      _(longest_common_prefix ["aa","aa"]).must_equal 'aa'
    end
  end

  describe 'example 4' do
    it 'must_equal' do
      _(longest_common_prefix ["cir","car"]).must_equal 'c'
    end
  end
end
