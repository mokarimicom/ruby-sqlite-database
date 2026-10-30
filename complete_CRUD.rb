require "sqlite3"

db = SQLite3::Database.new("app.db")
db.results_as_hash = true

db.execute <<-SQL
  CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    age INTEGER NOT NULL
  );
SQL

def list_users(db)
  db.execute("SELECT * FROM users") do |row|
    puts "#{row['id']} | #{row['name']} | #{row['age']}"
  end
end

loop do
  puts "\n=== RUBY SQLITE ==="
  puts "1. Add user"
  puts "2. List users"
  puts "3. Find user"
  puts "4. Update user"
  puts "5. Delete user"
  puts "6. Count users"
  puts "0. Exit"
  print "Choose: "

  choice = gets&.strip
  break if choice.nil? || choice == "0"

  case choice
  when "1"
    print "Name: "
    name = gets&.strip
    print "Age: "
    age = gets&.strip

    if name && !name.empty? && age&.match?(/\A\d+\z/)
      db.execute(
        "INSERT INTO users (name, age) VALUES (?, ?)",
        [name, age.to_i]
      )
      puts "User added!"
    else
      puts "Invalid name or age."
    end

  when "2"
    list_users(db)

  when "3"
    print "User ID: "
    id = gets&.strip

    if id&.match?(/\A\d+\z/)
      user = db.get_first_row(
        "SELECT * FROM users WHERE id = ?",
        [id.to_i]
      )

      puts(user ? "#{user['id']} | #{user['name']} | #{user['age']}" : "User not found")
    else
      puts "Invalid ID."
    end

  when "4"
    print "User ID: "
    id = gets&.strip
    print "New name: "
    name = gets&.strip
    print "New age: "
    age = gets&.strip

    if id&.match?(/\A\d+\z/) &&
       name && !name.empty? &&
       age&.match?(/\A\d+\z/)
      db.execute(
        "UPDATE users SET name = ?, age = ? WHERE id = ?",
        [name, age.to_i, id.to_i]
      )
      puts(db.changes.positive? ? "User updated!" : "User not found.")
    else
      puts "Invalid input."
    end

  when "5"
    print "User ID: "
    id = gets&.strip

    if id&.match?(/\A\d+\z/)
      db.execute("DELETE FROM users WHERE id = ?", [id.to_i])
      puts(db.changes.positive? ? "User deleted!" : "User not found.")
    else
      puts "Invalid ID."
    end

  when "6"
    count = db.get_first_value("SELECT COUNT(*) FROM users")
    puts "Total users: #{count}"

  else
    puts "Invalid choice."
  end
end

db.close
puts "Goodbye!"