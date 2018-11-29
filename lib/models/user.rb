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
        get_users
    end

    def self.create(info)
        info = JSON.parse(info)
        name = info['name']
        password = info['password']

        connection.exec("INSERT INTO users (name, password) VALUES ('#{name}', '#{password}');")

        id = find_id(name)
        info = {"id": id }.merge(info)
        info
    end

    def self.delete(id)
        user = find(id)
        connection.exec("DELETE FROM users WHERE id = '#{id}';")
        user
    end

    private

    def self.connection(pg = PG)
        pg.connect(dbname: ('whatsapp' + '-' + (ENV['RACK_ENV'] || '')))
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