require 'sinatra'
require "./lib/controllers/users"

database = 'whatsapp'
database += '-test' if ENV['RACK_ENV'] == 'test'

class WhatsAppAPI < Sinatra::Base
    use UsersController
    get "/" do
        "Hello World, from API"
    end
end
