require "sqlite3"

db = SQLite3::Database.new("app.db")

db.execute(
  "DELETE FROM users WHERE id = ?",
  [1]
)

puts "Rows deleted: #{db.changes}"

db.close