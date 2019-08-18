# frozen_string_literal: true

# デメテルの法則を確認するためのクラス
class DemeterTest
  attr_reader :child, :value
  def initialize(args)
    @child = args[:child]
    @value = args[:value]
  end

  def print
    puts value
  end

  def child_print
    child&.print
  end
end

test = DemeterTest.new(
  value: 'test1',
  child: DemeterTest.new(value: 'test2')
)

# OK
test.print
test.child_print

# NG
test.child.print
