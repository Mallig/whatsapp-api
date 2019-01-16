require './lib/users/user'
require './lib/login/login_messages'

class LoginService
    def self.login(req)
        user = User.first(:username => req["username"])
        response = {}
        unless user.nil?
            if user[:password] == req["password"]
                response["message"] = LoginMessages::SUCCESS
            else
                response["message"] = LoginMessages::FAILURE
            end
        end
        return response
    end
end
