require './lib/models/user'

DBNAME = 'whatsapp_users_test'

# DataMapper.auto_migrate! if ENV['RACK_ENV'] == 'test'

def users_pop
    JSON.parse(File.read('public/database_populator.json'))["users"]
end

def clear_users
    User.destroy
end

def populate_users
    users_pop.each do |row|
        User.create(username: row["username"], password: row["password"])
    end
end

clear_users
populate_users
