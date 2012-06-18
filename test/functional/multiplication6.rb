# !/usr/bin/ruby
#coding : utf-8

# テスト駆動開発入門6章　再度すべてに対する等価性

require "test/unit"

class Test_Money < Test::Unit::TestCase
  
  def test_multiplication
    five = Dollar.new(5)
    assert_equal(Dollar.new(10),five*2)
    assert_equal(Dollar.new(15),five*3)
  end
  
  def test_equality
    assert(Dollar.new(5) == Dollar.new(5))
    assert(Dollar.new(5) != Dollar.new(6))
    assert(Franc.new(5) == Franc.new(5))
    assert(Franc.new(5) != Franc.new(6))
  end
  
  def test_Franc_multiplication
    five = Franc.new(5)
    assert_equal(Franc.new(10), five * 2)
    assert_equal(Franc.new(15), five * 3)
  end
end

class Money

  attr_accessor :amount
  protected :amount

  # @amountに直接アクセスできないのでgetterを定義
  def ==(other)
    return @amount == other.amount
  end

end

class Dollar < Money
  
  def initialize(amount)
    @amount = amount
  end
  
  def *(multiplier)
    return Dollar.new(@amount*multiplier)
  end
  
  
end

class Franc < Money
  
  def initialize(amount)
    @amount = amount
  end
  
  def *(multiplier)
    return Franc.new(@amount * multiplier)
  end
  
end
