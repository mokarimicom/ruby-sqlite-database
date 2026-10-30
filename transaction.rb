require "sqlite3"

db = SQLite3::Database.new("app.db")

begin
  db.transaction do
    db.execute(
      "INSERT INTO users (name, age) VALUES (?, ?)",
      ["David", 28]
    )

    db.execute(
      "INSERT INTO users (name, age) VALUES (?, ?)",
      ["Emma", 31]
    )
  end

  puts "Transaction completed!"
rescue SQLite3::Exception => e
  puts "Database error: #{e.message}"
end

db.close