# !/usr/bin/ruby
#coding : utf-8
require "test/unit"

class Test_Dollar < Test::Unit::TestCase
  
  def test_multiplication
    five = Dollar.new(5)
    product = five.times(2)
    assert_equal(10,product.get_amount)
    product = five.times(3)
    assert_equal(15,product.get_amount)
  end
end

class Dollar
  def initialize(amount)
    @amount = amount
  end
  
  def times(multiplier)
    return Dollar.new(@amount*multiplier)
  end
  
  # @amountに直接アクセスできないのでgetterを定義
  def get_amount()
    return @amount
  end
end

