require_relative './calculator.rb'

class Item
  attr_accessor :label, :price, :quantity, :exempt, :imported, :price_with_tax

  EXEMPTED_ITEMS = %w[book pills chocolate].freeze

  def initialize(args)
    @label = args[:label]
    @price = args[:price]
    @quantity = args[:quantity]
    @exempt = item_exempted?
    @imported = !item_imported?
    @price_with_tax = calculate_price_with_tax
  end

  def item_exempted?
    EXEMPTED_ITEMS.any? { |exempt| label =~ /#{exempt}/ }
  end

  def item_imported?
    (label =~ /imported/).nil?
  end

  def calculate_price_with_tax
    Calculator.new.calculate_item_total_price(self)
  end

  def to_s
    "#{quantity} #{label}: #{price_with_tax}"
  end
end
