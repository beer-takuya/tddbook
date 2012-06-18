# !/usr/bin/ruby
#coding : utf-8

# テスト駆動開発入門7章　りんごとみかん

require "test/unit"

class Test_Money < Test::Unit::TestCase
  
  def test_multiplication
    five = Dollar.new(5)
    assert_equal(Money.dollar(10),five*2)
    assert_equal(Money.dollar(15),five*3)
  end
  
  def test_equality
    assert(Money.dollar(5) == Money.dollar(5))
    assert(Money.dollar(5) != Money.dollar(6))
    assert(Money.franc(5) == Money.franc(5))
    assert(Money.franc(5) != Money.franc(6))
    assert(Money.franc(5) != Money.dollar(5))
  end
  
  def test_Franc_multiplication
    five = Franc.new(5)
    assert_equal(Money.franc(10), five * 2)
    assert_equal(Money.franc(15), five * 3)
  end
end

class Money

  attr_accessor :amount
  protected :amount

  # @amountに直接アクセスできないのでgetterを定義
  def ==(other)
    return @amount == other.amount && self.class == other.class
  end

  def self.franc(amount)
    return Franc.new(amount)
  end
  
  def self.dollar(amount)
    return Dollar.new(amount)
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
