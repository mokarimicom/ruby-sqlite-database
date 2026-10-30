require "sqlite3"

db = SQLite3::Database.new("app.db")
db.results_as_hash = true

name = "Alice"

db.execute(
  "SELECT * FROM users WHERE name = ?",
  [name]
) do |row|
  puts "#{row['id']}: #{row['name']} (#{row['age']})"
end

db.close