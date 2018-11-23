require 'json'

class User
    
    def initialize
        file = File.read('public/users.json')
        @users_json = JSON.parse(file)
    end

    def find(id)
        @users_json["users"].each do |user|
            if (user["id"] == id)
                return user
            else
                return "user not found"
            end
        end
    end

    def all
        @users_json
    end

    private

end