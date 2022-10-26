class Receipt
  attr_accessor :cart

  def initialize(cart)
    @cart = cart
  end

  def print
    cart.items.each do |item|
      puts item.to_s
    end
    puts "Sales Taxes: #{sales_taxes.round(2)}"
    puts "Total: #{cart.total}"
  end

  def sales_taxes
    cart.total - cart.items.sum { |item| item.quantity.to_i * item.price }
  end
end
