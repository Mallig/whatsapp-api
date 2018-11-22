require 'sinatra'
require "./lib/controllers/users"

class WhatsAppAPI < Sinatra::Base
    use Users
    get "/" do
        "Hello World, from API"
    end 
end