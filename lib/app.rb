require './lib/secure_controller'
require './lib/users/users_controller'
require './lib/login/login_controller'

class WhatsAppUsers < SecureController
    use UsersController
    use LoginController
    
    get "/" do
        "Hello World, from users API"
    end
end
