require './lib/users/user'
require './lib/login/login_messages'

class LoginService
    def self.login(req)
        if req != ""
            req = JSON.parse(req)
            user = User.first(:fields => [:password], :username => req["username"])
            response = {}
            unless user.nil?
                if user[:password] == req["password"]
                    response["message"] = LoginMessages::SUCCESS
                else
                    response["message"] = LoginMessages::FAILURE
                end
            end
        else
            return {:message => ResponseMessages::NOTHING_PROVIDED}.to_json
        end
        return response.to_json
    end
end
