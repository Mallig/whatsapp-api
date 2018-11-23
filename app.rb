require 'sinatra'
require "./lib/controllers/users"

class WhatsAppAPI < Sinatra::Base
    use UsersController
    get "/" do
        "Hello World, from API"
    end 
end