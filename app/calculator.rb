class Calculator
  BASIC_TAX = 0.10
  IMPORTED_TAX = 0.05

  attr_accessor :cart_items

  def initialize(cart_items = [])
    @cart_items = cart_items
  end

  def calculate_cart_total
    sum = 0
    cart_items.each { |item| sum += calculate_item_total_price(item) }

    sum
  end

  def calculate_item_total_price(item)
    total_tax = item_total_tax(item)
    item_total = item.price * item.quantity.to_i

    if total_tax.positive?
      total_price = item_total + (item_total * total_tax)
    else
      total_price = item_total
    end

    total_price.round(2)
  end

  def item_total_tax(item)
    total_tax = 0
    total_tax += BASIC_TAX unless item.exempt
    total_tax += IMPORTED_TAX if item.imported
    total_tax
  end
end
