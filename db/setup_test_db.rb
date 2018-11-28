require 'pg'
require './db/table_pops'

def reset_table(database, table)
    connection = PG.connect(dbname:database)
    connection.exec("DROP TABLE IF EXISTS #{table};")
    connection.exec("CREATE TABLE users (name varchar(30), password varchar(10));")
    connection.exec("ALTER TABLE users ADD COLUMN ID SERIAL PRIMARY KEY;")
end

def populate_users_table
    connection = PG.connect(dbname:'whatsapp-test')
    $users_pop.each do |row|
        connection.exec("INSERT INTO users (name, password) VALUES ('#{row[0]}', '#{row[1]}');")
    end
end
