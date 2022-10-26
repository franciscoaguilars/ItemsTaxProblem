class Parser
  attr_reader :item_string
  attr_accessor :item_hash

  def initialize(item_string)
    @item_string = item_string
    @item_hash = {}
  end

  def call
    parse_price
    parse_quantity
    parse_label
    item_hash
  end

  private

  def parse_price
    item_hash[:price] = item_string.split(/ at /).last.to_f
  end

  def parse_quantity
    item_hash[:quantity] = item_string.split.first
  end

  def parse_label
    splitted_label =  item_string.split(/ at /).first.split(item_hash[:quantity])
    item_hash[:label] = splitted_label.last.strip
  end
end