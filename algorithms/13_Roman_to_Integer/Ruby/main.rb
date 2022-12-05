# frozen_string_literal: true

# @param {String} s
# @return {Integer}
def roman_to_int(s)
  romans = s.split('')
  i = 0
  result = 0
  while i < romans.size
    if (i+1) < romans.size && (
      (romans[i] == 'I' && (romans[i+1] == 'V' || romans[i+1] == 'X')) ||
      (romans[i] == 'X' && (romans[i+1] == 'L' || romans[i+1] == 'C')) ||
      (romans[i] == 'C' && (romans[i+1] == 'D' || romans[i+1] == 'M')))
      result += symbol_value(romans[i] + romans[i+1])
      i += 1
    else
      result += symbol_value romans[i]
    end
    i += 1
  end
  result
end

def symbol_value s
  case s
  when 'I'
    1
  when 'IV'
    4
  when 'V'
    5
  when 'IX'
    9
  when 'X'
    10
  when 'XL'
    40
  when 'L'
    50
  when 'XC'
    90
  when 'C'
    100
  when 'CD'
    400
  when 'D'
    500
  when 'CM'
    900
  when 'M'
    1_000
  else
    0
  end
end

require "minitest/autorun"

describe '#roman_to_int' do
  describe 'example 1' do
    it 'must_equal' do
      _(roman_to_int 'III').must_equal 3
    end
  end

  describe 'example 2' do
    it 'must_equal' do
      _(roman_to_int 'LVIII').must_equal 58
    end
  end

  describe 'example 3' do
    it 'must_equal' do
      _(roman_to_int 'MCMXCIV').must_equal 1994
    end
  end
end
