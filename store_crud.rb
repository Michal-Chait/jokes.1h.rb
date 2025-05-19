# Exercise:
# You are the owner of a store that sells items (you decide what specifically). Each item has various properties such as color, price, etc.
# Make a terminal app to manage your store items in a database, with the ability to create, read, update, and delete data.

require "sqlite3"    # adding sqlite database
require "tty-table"

db = SQLite3::Database.open "store.db"      # opening sqlite data- employee database
db.execute "CREATE TABLE IF NOT EXISTS store(id INTEGER PRIMARY KEY, item TEXT, color TEXT, price INTEGER, active INTEGER)"  # executing that if it doesnt exist, creat id with integer, first_name, last_name, salary, and active

while true        # while this is correct
  system "clear"    # the system is clear
  results = db.query "SELECT * FROM store"     # results are selectd from employee data 
  header = ["id", "item", "color", "price", "active"]                # defines the data headers
  rows = results.to_a   #the results of query should be used
  table = TTY::Table.new header, rows   # a table is created
  puts "STORE (#{rows.length} total)"  # employees is being put in all of the rows
  puts table.render(:unicode)  # table is rendered- unicode
  puts
  print "[C]reate [R]ead [U]pdate [D]elete [Q]uit: "   # prints
  input_choice = gets.chomp.downcase  # user inputs- their input becomes lowercase
  if input_choice == "c"   # if user inputs 'c'
    print "Item: " # prints first name - creates
    input_item = gets.chomp # gets first name input from user and creates
    print "Color: "  # prints last name - creates
    input_color = gets.chomp # gets last name input from user
    print "Price: " # prints salary
    input_price = gets.chomp.to_i # user inputs their salary
    db.execute "INSERT INTO store (item, color, price, active) VALUES (?, ?, ?, ?)", [input_item, input_color, input_price, 1] # the users input is inserted into table by first employee
  elsif input_choice == "r" # prints out the database - reads
    print "Store id: " # prints employee id
    input_id = gets.chomp.to_i # user inputs
    results = db.query "SELECT * FROM store WHERE id = ?", input_id # selects employee data using user's id input
    first_result = results.next # puts in employee
    puts "Id: #{first_result[0]}" # prints emploees information
    puts "Item: #{first_result[1]}"
    puts "Color: #{first_result[2]}"
    puts "Price: #{first_result[3]}"
    puts "Active: #{first_result[4]}"
    puts
    print "Press enter to continue"
    gets.chomp
  elsif input_choice == "u" # if user enters u
    print "Store id: "
    input_id = gets.chomp.to_i # user inputs id
    print "Update active status (true or false): "
    input_active = gets.chomp
    if input_active == "true" # if user enters true
      input_active = 1 # input active value is changed to 1
    else # if user did not enter true
      input_active = 0  # input active value is changed to 0
    end
    db.execute "UPDATE store SET active = ? WHERE id = ?", [input_active, input_id]
  elsif input_choice == "d" #deletes
    puts "Delete store"
    print "Enter store id: "
    input_id = gets.chomp.to_i
    db.execute "DELETE FROM store WHERE id = ?", input_id
  elsif input_choice == "q" #quits
    system "clear" # if input 'q', system clears
    puts "Goodbye!" # prints 'goodbye'
    return
  else
    puts "Invalid choice"
    print "Press enter to continue"
    gets.chomp
  end
end