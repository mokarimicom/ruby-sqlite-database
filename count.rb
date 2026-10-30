require "sqlite3"

db = SQLite3::Database.new("app.db")

count = db.get_first_value("SELECT COUNT(*) FROM users")

puts "Total users: #{count}"

db.close