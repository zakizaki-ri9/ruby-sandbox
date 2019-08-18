# frozen_string_literal: true

require 'forwardable'

# デメテルの法則を確認するためのクラス
class DemeterTest
  extend Forwardable

  attr_reader :child
  def initialize(args)
    @child = args[:child]
    @value = args[:value]
  end

  def print
    puts @value
  end

  def_delegator :child, :print, :child_print
  # def child_print
  #   child&.print
  # end
end

test = DemeterTest.new(
  value: 'test1',
  child: DemeterTest.new(value: 'test2')
)

# OK def_delegatorで委譲
test.child_print
