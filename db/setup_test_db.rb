require 'pg'

DBNAME = 'postgresql-amorphous-49318'

def users_pop
    JSON.parse(File.read('public/users.json'))["users"]
end

def reset_table
    connection = PG.connect(dbname: DBNAME)
    connection.exec("DROP TABLE IF EXISTS users;")
    connection.exec("CREATE TABLE users (ID SERIAL PRIMARY KEY,
                                         name varchar(30) UNIQUE, 
                                         password varchar(10));")
end

def populate_users_table
    connection = PG.connect(dbname: DBNAME)
    users_pop.each do |row|
        connection.exec("INSERT INTO users (name, password) VALUES ('#{row["name"]}', '#{row["password"]}');")
    end
end

reset_table
populate_users_table
