require './lib/secure_controller'
require './lib/response_messages'
require './lib/login/login_service'

class LoginController < SecureController
    post '/login' do
        LoginService.login(request.body.read)
    end
end
