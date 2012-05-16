# !/usr/bin/ruby
#coding : utf-8
require "test/unit"

class Test_Doller < Test::Unit::TestCase
  
  def test_multiplication
    five = Dollar.new(5)
    five.times(2)
    assert_equal(10,five.get_amount)
  end
end

class Dollar
  def initialize(amount)
    @amount = amount
  end
  
  def times(multiplier)
    @amount *= multiplier
  end
  
  # @amountに直接アクセスできないのでgetterを定義
  def get_amount()
    return @amount
  end
end

