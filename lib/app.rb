require 'sinatra'
require './lib/users/users'
require './lib/login/login'

class WhatsAppUsers < Sinatra::Base
    use UsersController
    use LoginController
    get "/" do
        "Hello World, from users API"
    end
end
