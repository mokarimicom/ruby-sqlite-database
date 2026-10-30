require "sqlite3"

db = SQLite3::Database.new("app.db")

db.execute(
  "INSERT INTO users (name, age) VALUES (?, ?)",
  ["Alice", 25]
)

puts "User inserted!"

db.close