# frozen_string_literal: true

require 'active_support'

# デメテルの法則を確認するためのクラス
class DemeterTest
  attr_reader :value
  delegate :child_print, to: :@child

  def initialize(args)
    @child = args[:child]
    @value = args[:value]
  end

  def print
    puts @value
  end
end

# Child
class Child
  def initialize(args)
    @value = args[:value]
  end

  def child_print
    puts @value
  end
end

test = DemeterTest.new(
  value: 'test1',
  child: Child.new(value: 'child1')
)

# OK delegateで委譲
test.child_print
