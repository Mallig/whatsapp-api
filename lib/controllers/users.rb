require 'sinatra'
require 'json'
require './lib/models/user'

class UsersController < Sinatra::Base

    get '/users' do
        content_type :json
        
        User.all.to_json
    end


    post '/users' do
        content_type :json

        user = request.body.read
        User.create(user).to_json
    end
    
    get '/users/:id' do
        content_type :json
        
        id = params[:id].to_i
        User.find(id).to_json
    end

end