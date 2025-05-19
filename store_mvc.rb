require "sqlite3"
require "tty-table"

class Store
  @@db = SQLite3::Database.open "store.db"
  @@db.execute "CREATE TABLE IF NOT EXISTS store(id INTEGER PRIMARY KEY, item TEXT, price TEXT, color INTEGER, rating INTEGER)"

  attr_reader :id, :item, :price, :color, :rating
  attr_writer :item

  def initialize(input_options)
    @id = input_options[:id]
    @item = input_options[:item]
    @price = input_options[:price]
    @color = input_options[:color]
    @rating = input_options[:rating]
  end

  def self.create(options)
    @@db.execute "INSERT INTO store (item, price, color, rating) VALUES (?, ?, ?, ?)",
      [options[:item], options[:price], options[:color], options[:rating]]
  end

  def self.all
    results = @@db.query "SELECT * FROM store"
    results.map do |row|
      Store.new(id: row[0], item: row[1], price: row[2], color: row[3], rating: row[4])
    end
  end

  def self.find_by(options)
    results = @@db.query "SELECT * FROM store WHERE id = ?", options[:id]
    first_result = results.next
    return nil unless first_result
    Store.new(id: first_result[0], item: first_result[1], price: first_result[2], color: first_result[3], rating: first_result[4])
  end

  def update(options)
    @item = options[:item] if options[:item]
    @@db.execute "UPDATE store SET price = ? WHERE id = ?", [item, self.id]
  end

  def destroy
    @@db.execute "DELETE FROM store WHERE id = ?", self.id
  end
end

class View
  def self.display_store(store)
    header = ["id", "item", "price", "color", "rating"]
    rows = store.map { |store| [store.id, store.item, store.price, store.color, store.rating] }
    table = TTY::Table.new header, rows
    puts "STORE (#{rows.length} total)"
    puts table.render(:unicode)
    puts
  end

  def self.display_store_list(store)
    puts "Id: #{store.id}"
    puts "Item: #{store.item}"
    puts "Price: #{store.price}"
    puts "Color: #{store.color}"
    puts "Rating: #{store.rating}"
    puts
    print "Press enter to continue"
    gets.chomp
  end

  def self.display_exit_screen
    system "clear"
    puts "Goodbye!"
  end

  def self.display_error_screen
    puts "Invalid choice"
    print "Press enter to continue"
    gets.chomp
  end

  def self.get_menu_option
    print "[C]reate [R]ead [U]pdate [D]elete [Q]uit: "
    gets.chomp.downcase
  end

  def self.get_create_options
    print "Item: "
    input_item = gets.chomp
    print "Price: "
    input_price = gets.chomp
    print "Color: "
    input_color = gets.chomp.to_i
    print "Rating: "
    input_rating = gets.chomp.to_i
    { item: input_item, price: input_price, color: input_color, rating: input_rating }
  end

  def self.get_read_options
    print "Store id: "
    input_id = gets.chomp.to_i
    { id: input_id }
  end

  def self.get_update_options
    print "Store id: "
    input_id = gets.chomp.to_i
    print "Update item status (true or false): "
    input_item = gets.chomp
    { id: input_id, item: input_item }
  end

  def self.get_destroy_options
    puts "Delete store"
    print "Enter store id: "
    input_id = gets.chomp.to_i
    { id: input_id }
  end
end

class Controller
  def self.run
    while true
      system "clear"
      store = Store.all
      View.display_store(store)
      input_choice = View.get_menu_option
      if input_choice == "c"
        input_options = View.get_create_options
        Store.create(input_options)
      elsif input_choice == "r"
        input_options = View.get_read_options
        store = Store.find_by(input_options)
        View.display_store(store)
      elsif input_choice == "u"
        input_options = View.get_update_options
        store = Store.find_by(id: input_options[:id])
        store.update(input_options)
      elsif input_choice == "d"
        input_options = View.get_destroy_options
        store = Store.find_by(input_options)
        store.destroy
      elsif input_choice == "q"
        View.display_exit_screen
        return
      else
        View.display_error_screen
      end
    end
  end
end

Controller.run