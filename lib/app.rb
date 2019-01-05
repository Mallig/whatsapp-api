require 'sinatra'
require "./lib/controllers/users"
require './lib/data_mapper_setup'

class WhatsAppUsers < Sinatra::Base
    use UsersController
    get "/" do
        "Hello World, from users API"
    end
end
