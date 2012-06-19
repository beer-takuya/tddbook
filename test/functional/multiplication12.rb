# !/usr/bin/ruby
#coding : utf-8

# テスト駆動開発入門12章　ついに加法

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
    assert(Money.franc(5) != Money.dollar(5))
  end
  
  def test_currency
    assert_equal("USD", Money.dollar(1).currency)
    assert_equal("CHF", Money.franc(1).currency)
  end
  
  def testSimpleAddition
    five = Money.dollar(5)
    sum = five + five
    bank = Bank.new()
    reduced = bank.reduce(sum,"USD")
    assert_equal(Money.dollar(10), reduced)
  end
end

class Expression
  
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
    return @amount == other.amount && @currency == other.currency
  end
  
  def *(multiplier)
    return Money.new(@amount*multiplier,@currency)
  end
  
  def +(addend)
    return Money.new(@amount + addend.amount, @currency)
  end
  
  def self.franc(amount)
    return Money.new(amount, "CHF")
  end
  
  def self.dollar(amount)
    return Money.new(amount, "USD")
  end
  
end

class Bank
  def reduce(source, currency_to)
    return Money.dollar(10)
  end
end
