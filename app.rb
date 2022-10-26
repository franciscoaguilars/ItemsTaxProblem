require_relative './app/cart'
require_relative './app/item'
require_relative './app/parser'
require_relative './app/receipt'

# Get a random sample input
rand_num = rand(1..3)
sample_filename = "sample_#{rand_num}"

# Initialize our empty shopping cart
cart = Cart.new

# Iterate through each line to create a new item and add it to our Cart
File.foreach("./example_inputs/#{sample_filename}.txt") do |line|
  parsed_item = Parser.new(line).call
  new_item = Item.new(label: parsed_item[:label], price: parsed_item[:price], quantity: parsed_item[:quantity])
  cart.add(new_item)
end

# Calulate the total of the cart
cart.calculate_total

# Print receipt
Receipt.new(cart).print