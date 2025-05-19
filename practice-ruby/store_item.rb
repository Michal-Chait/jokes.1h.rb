# C.1 - You are the owner of a store that sells items (you decide what specifically). Each item has various properties such as color, price, etc.
# C.2 - Represent 3 items using hashes. Each hash should have the same keys with different values.
# C.3 - Be sure to use symbols for the keys. Try creating hashes using both types of hash symbol syntaxes. (Ruby syntax {:a => 123} vs. “JavaScript” syntax {a: 123}).

# C.1
shirt = {color: "pink", price: 49.99, style: "blouse"}
shoes = {color: "black", price: 78.39, style: "combat_boots"}

# C.2
ball1 = {type: "baseball", inches: 9, color: "white"}
ball2 = {type: "basketball", inches: 30, color: "orange"}
ball3 = {type: "pickleball", inches: 3, color: "white"}

# C.3
# puts ball1

# Rewrite your store items using a class instead of a hash.
# a) Choose which attributes should have “reader” methods and which attributes should have “writer” methods.
# b) Create an instance from your store item class. Use puts statements to print the 3 attributes individually to the terminal.
# c) Use the attr_writer method to change a value

class Store
  attr_reader :color, :price, :style
  attr_writer :color, :style
  def initialize(color, price, style)
    @color = color
    @price = price
    @style = style
  end
end
shirt = Store.new("pink", 49.99, "blouse")
shoes = Store.new("black", 78.39, "combat_boots")
puts shirt.color
puts shirt.price
puts shirt.style
puts shoes.price
shirt.color = "white"
puts shirt.color