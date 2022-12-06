# frozen_string_literal: true

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def merge_two_lists(list1, list2)
  a = list1
  b = list2
  if a.nil? && b.nil?
    return nil
  elsif a.nil?
    return b
  elsif b.nil?
    return a
  end

  result = nil
  if a.val <= b.val
    result = ListNode.new a.val
    a = a.next
  else
    result = ListNode.new b.val
    b = b.next
  end

  current = result
  while !a.nil? && !b.nil?
    if a.val <= b.val
      current.next = ListNode.new a.val
      a = a.next
    else
      current.next = ListNode.new b.val
      b = b.next
    end
    current = current.next
  end

  while !a.nil?
    current.next = ListNode.new a.val
    a = a.next
    current = current.next
  end

  while !b.nil?
    current.next = ListNode.new b.val
    b = b.next
    current = current.next
  end

  result
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

describe '#merge_two_lists' do
  describe 'example 1' do
    before do
      @first_input = ListNode.new 1
      @first_input.next = ListNode.new 2
      @first_input.next.next = ListNode.new 4

      @second_input = ListNode.new 1
      @second_input.next = ListNode.new 3
      @second_input.next.next = ListNode.new 4

      @output = ListNode.new 1
      @output.next = ListNode.new 1
      @output.next.next = ListNode.new 2
      @output.next.next.next = ListNode.new 3
      @output.next.next.next.next = ListNode.new 4
      @output.next.next.next.next.next = ListNode.new 4
    end

    it 'must_equal' do
      _(merge_two_lists @first_input, @second_input).must_equal @output
      assert_nil merge_two_lists(nil, nil)
    end
  end

  describe 'example 2' do
    it 'assert_nil' do
      _(merge_two_lists nil, nil).must_be_nil
    end
  end

  describe 'example 3' do
    it 'must_equal' do
      _(merge_two_lists nil, ListNode.new(0)).must_equal ListNode.new 0
    end
  end
end
