require './lib/secure_controller'
require './lib/response_messages'
require './lib/login/login_service'

class LoginController < SecureController
    post '/login' do
        req = request.body.read
        if req != ""
            return LoginService.login(JSON.parse(req)).to_json
        else
            return {:message => ResponseMessages::NOTHING_PROVIDED}.to_json
        end
    end
end
