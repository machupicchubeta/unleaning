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
  n, m = a.val.to_s, b.val.to_s
  while !a.next.nil? && !b.next.nil?
    a, b = a.next, b.next
    n += a.val.to_s
    m += b.val.to_s
  end
  while !a.next.nil?
    a = a.next
    n += a.val.to_s
  end
  while !b.next.nil?
    b = b.next
    m += b.val.to_s
  end

  p = (n.reverse.to_i + m.reverse.to_i).to_s.reverse
  q = ListNode.new p[0]
  o = q
  i = 1
  while i < p.size
    q.next = ListNode.new p[i]
    q = q.next
    i += 1
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
