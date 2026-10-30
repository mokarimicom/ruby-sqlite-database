require "sqlite3"

db = SQLite3::Database.new("app.db")

db.execute <<-SQL
  CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    age INTEGER NOT NULL
  );
SQL

puts "Database and table created!"

db.close