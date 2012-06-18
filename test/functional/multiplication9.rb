# !/usr/bin/ruby
#coding : utf-8

# テスト駆動開発入門9章　生きている時(times)

require "test/unit"

class Test_Money < Test::Unit::TestCase
  
  def test_multiplication
    five = Money.dollar(5)
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
    five = Money.franc(5)
    assert_equal(Money.franc(10), five * 2)
    assert_equal(Money.franc(15), five * 3)
  end
end

class Money

  attr_accessor :amount, :currency
  protected :amount

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  # @amountに直接アクセスできないのでgetterを定義
  def ==(other)
    return @amount == other.amount && self.class == other.class
  end

  def self.franc(amount)
    return Franc.new(amount, "CHF")
  end
  
  def self.dollar(amount)
    return Dollar.new(amount, "USD")
  end

end

class Dollar < Money
  
  def *(multiplier)
    return Money.dollar(@amount*multiplier)
  end
  
  
end

class Franc < Money
  
  def *(multiplier)
    return Money.franc(@amount * multiplier)
  end
  
end
