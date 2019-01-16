require 'sinatra'
require './lib/controllers/users'
require './lib/controllers/login'

class WhatsAppUsers < Sinatra::Base
    use UsersController
    use LoginController
    get "/" do
        "Hello World, from users API"
    end
end
