require "sqlite3"

db = SQLite3::Database.new("app.db")

users = [
  ["Alice", 25],
  ["Bob", 30],
  ["Charlie", 22]
]

users.each do |name, age|
  db.execute(
    "INSERT INTO users (name, age) VALUES (?, ?)",
    [name, age]
  )
end

puts "Users inserted!"

db.close