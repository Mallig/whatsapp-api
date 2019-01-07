require 'sinatra'
require "./lib/controllers/users"

class WhatsAppUsers < Sinatra::Base
    use UsersController
    get "/" do
        "Hello World, from users API"
    end
end
