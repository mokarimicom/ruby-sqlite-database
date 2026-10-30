require "sqlite3"

db = SQLite3::Database.new("app.db")

db.execute(
  "UPDATE users SET name = ?, age = ? WHERE id = ?",
  ["Alice Updated", 26, 1]
)

puts "Rows changed: #{db.changes}"

db.close