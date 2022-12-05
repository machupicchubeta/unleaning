# frozen_string_literal: true

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  a, b = l1, l2
  i = a.val + b.val
  if i >= 10
    j = i - 10
    k = 1
  else
    j = i
    k = 0
  end
  o = ListNode.new j
  current = o
  while !a.next.nil? && !b.next.nil?
    a, b = a.next, b.next
    i = a.val + b.val + k
    if i >= 10
      j = i - 10
      k = 1
    else
      j = i
      k = 0
    end
    current.next = ListNode.new j
    current = current.next
  end
  while !a.next.nil?
    a = a.next
    i = a.val + k
    if i >= 10
      j = i - 10
      k = 1
    else
      j = i
      k = 0
    end
    current.next = ListNode.new j
    current = current.next
  end
  while !b.next.nil?
    b = b.next
    i = b.val + k
    if i >= 10
      j = i - 10
      k = 1
    else
      j = i
      k = 0
    end
    current.next = ListNode.new j
    current = current.next
  end
  if k > 0
    current.next = ListNode.new k
  end

  o
end

require "minitest/autorun"

class ListNode
  def ==(other)
    a, b = self, other
    return true if a.next.nil? && b.next.nil?

    while a.next.nil? || b.next.nil?
      return false if a.val != b.val

      return false if a.next.nil? && !b.next.nil?
      return false if !a.next.nil? && b.next.nil?

      a = a.next
      b = b.next
    end

    return false if a.next.nil? && !b.next.nil?
    return false if !a.next.nil? && b.next.nil?

    true
  end
end

describe '#add_two_numbers' do
  describe 'example 1' do
    before do
      @first_input = ListNode.new 2
      @first_input.next = ListNode.new 4
      @first_input.next = ListNode.new 3

      @second_input = ListNode.new 5
      @second_input.next = ListNode.new 6
      @second_input.next = ListNode.new 4

      @output = ListNode.new 7
      @output.next = ListNode.new 0
      @output.next = ListNode.new 8
    end

    it 'must_equal' do
      _(add_two_numbers @first_input, @second_input).must_equal @output
    end
  end

  describe 'example 2' do
    before do
      @first_input = ListNode.new 0
      @second_input = ListNode.new 0
      @output = ListNode.new 0
    end

    it 'must_equal' do
      _(add_two_numbers @first_input, @second_input).must_equal @output
    end
  end

  describe 'example 3' do
    before do
      7.times do |i|
        eval "@first_input#{'.next' * i} = ListNode.new 9"
      end

      4.times do |i|
        eval "@second_input#{'.next' * i} = ListNode.new 9"
      end

      @output = ListNode.new 8
      @output.next = ListNode.new 9
      @output.next.next = ListNode.new 9
      @output.next.next.next = ListNode.new 9
      @output.next.next.next.next = ListNode.new 0
      @output.next.next.next.next.next = ListNode.new 0
      @output.next.next.next.next.next.next = ListNode.new 0
      @output.next.next.next.next.next.next.next = ListNode.new 1
    end

    it 'must_equal' do
      _(add_two_numbers @first_input, @second_input).must_equal @output
    end
  end
end
