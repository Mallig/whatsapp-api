require './lib/users/user'

module LoginService
    class << self
        def login(req)
            user = User.first(:username => req["username"])
            message = { "message": "you got something wrong mate" }
            unless user.nil?
                message = {
                    "message": "Hooray you've been logged in!"
                } if user[:password] == req["password"]
            end
            return message
        end
    end
end
