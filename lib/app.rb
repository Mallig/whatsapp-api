require 'sinatra'
require "./lib/controllers/users"
require './lib/data_mapper_setup'

class WhatsAppAPI < Sinatra::Base
    use UsersController
    get "/" do
        "Hello World, from API"
    end
end
