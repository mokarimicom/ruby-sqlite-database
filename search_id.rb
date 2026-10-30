require "sqlite3"

db = SQLite3::Database.new("app.db")
db.results_as_hash = true

id = 1

user = db.get_first_row(
  "SELECT * FROM users WHERE id = ?",
  [id]
)

if user
  puts "Name: #{user['name']}"
  puts "Age: #{user['age']}"
else
  puts "User not found"
end

db.close