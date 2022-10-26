require_relative './calculator.rb'

class Cart
  attr_accessor :items, :total

  def initialize
    @items = []
    @total = 0
  end

  def add(item)
    items << item
  end

  def calculate_total
    self.total = Calculator.new(items).calculate_cart_total
  end
end
