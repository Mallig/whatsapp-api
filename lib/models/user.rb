require 'json'
require 'pg'

class User
    def self.find(id)
        get_users.each do |user|
            return user if (user["id"].to_s == id.to_s)
        end

        return {error_message: "404 user not found"}
    end

    def self.all
        puts "database url: " + ENV['DATABASE_URL']
        conn = PG::Connection.open(:dbname => ENV['DATABASE_URL'])
        res = conn.exec("SELECT * FROM pg_stat_activity")
    end

    def self.create(info)
        info = JSON.parse(info)
        query = "INSERT INTO users (name, password) VALUES ('#{info['name']}', '#{info['password']}');"
        connection.exec(query)
        id = find_id(info['name'])
        { "id": id }.merge(info)
    end

    def self.delete(id)
        user = find(id)
        connection.exec("DELETE FROM users WHERE id = '#{id}';")
        user
    end

    private

    def self.connection
        
    end

    def self.get_users
        db_result_users = connection.exec("SELECT * FROM users")

        users_hash = { "users": [] }

        db_result_users.each do |user|
            users_hash[:users] << user
        end

        users_hash[:users]
    end

    def self.find_id(name)
        res = connection.exec("SELECT id FROM users WHERE name = '#{name}'")
        res.each do |row|
            return row['id']
        end
    end
end
