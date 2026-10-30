# Ruby SQLite Database

A simple database project built with Ruby and SQLite.

## Requirements

- Ruby
- SQLite


## Setup

Install dependencies:

```bash
sudo pacman -S ruby sqlite
gem install sqlite3
ruby create.rb 
ruby insert.rb 
ruby multiple_insert.rb 
ruby select.rb 

on vscode use SQLite DB Viewer extention .
or :
you want open database directly :
sqlite3 app.db

Inside SQLite:

.tables
.schema users
SELECT * FROM users;
SELECT COUNT(*) FROM users;
.quit
