require 'json'
require 'pg'

class User

    def find(id)
        get_users.each do |user|
            return user if (user["id"].to_s == id.to_s)
        end

        return "404 user not found"
    end

    def all
        get_users
    end

    private

    def connection
        PG.connect(dbname: ('whatsapp' + '-' + (ENV['RACK_ENV'] || '')))
    end

    def get_users
        db_result_users = connection.exec("SELECT * FROM users")

        users_hash = { "users": [] }

        db_result_users.each do |user|
            users_hash[:users] << user
        end

        users_hash[:users]
    end

end