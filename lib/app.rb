require 'sinatra'
require './lib/users/users_controller'
require './lib/login/login_controller'

class WhatsAppUsers < Sinatra::Base
    use UsersController
    use LoginController
    get "/" do
        "Hello World, from users API"
    end
end
