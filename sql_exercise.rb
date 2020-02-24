require 'sqlite3'

if File.exists?("maindata.db")
  File.delete("maindata.db")
end

db = SQLite3::Database.new("maindata.db")

db.execute <<-SQL
create table users(
  id integer primary key,
  email varchar,
  password varchar);
SQL

db.execute("insert into users(email, password) values(?, ?)", ["mary@example.com", "password"]);
db.execute("insert into users(email, password) values(?, ?)", ["daniela@example.com", "password"]);
db.execute("insert into users(email, password) values(?, ?)", ["logan@example.com", "password"]);

array = db.execute("select * from users");

puts array