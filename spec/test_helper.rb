require './lib/users/user'
require './lib/data_mapper_setup'

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

@headers = {"Content-Type" => "application/json"}

def post_with_headers(path, body)
    post path, body, @headers
end

def get_with_headers(path, body=nil)
    get path, body, @headers
end
