count = 0
while count <= 10
  puts count
  count += 1
end

puts "Sam enjoys cooking"
recipes = ["apple_crisp", "chocolate_cake", "stew"]
puts "Sally speaks many languages"
languages = ["English", "Hebrew", "Yiddish"]
if recipes.length > 10 && languages.length > 5
  puts "Sam and Sally should date!"
else
  puts "They should not date."
end

if recipes.include?("crepes") && languages.include?("French")
  puts "Sam and Sally should marry each other."
else
  puts "They should not marry."
end