require 'pg'

def users_pop
    JSON.parse(File.read('public/users.json'))["users"]
end

def reset_table(database, table)
    connection = PG.connect(dbname:database)
    connection.exec("DROP TABLE IF EXISTS #{table};")
    connection.exec("CREATE TABLE users (ID SERIAL PRIMARY KEY,
                                         name varchar(30) UNIQUE, 
                                         password varchar(10));")
    # connection.exec("ALTER TABLE users ADD COLUMN ID SERIAL PRIMARY KEY;")
end

def populate_users_table
    connection = PG.connect(dbname:'whatsapp-test')
    users_pop.each do |row|
        connection.exec("INSERT INTO users (name, password) VALUES ('#{row["name"]}', '#{row["password"]}');")
    end
end
