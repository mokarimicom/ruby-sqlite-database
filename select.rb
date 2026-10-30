require "sqlite3"

db = SQLite3::Database.new("app.db")

db.results_as_hash = true

db.execute("SELECT * FROM users") do |row|
  puts "ID: #{row['id']}"
  puts "Name: #{row['name']}"
  puts "Age: #{row['age']}"
  puts "----------------"
end

db.close