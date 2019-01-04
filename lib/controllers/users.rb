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
        user = JSON.parse(request.body.read)
        new_or_existing_user = User.create(
            :username => user["username"],
            :password => user["password"]
        )
        if new_or_existing_user.saved?
            return {
                :id => new_or_existing_user.id,
                :username => new_or_existing_user.username
            }.to_json
        else
            {:saved => false}.to_json 
        end
    end

    delete '/users/:id' do
        content_type :json
        id = params[:id]
        User.delete(id).to_json
    end
    
    get '/users/:id' do
        content_type :json
        id = params[:id].to_i
        User.find(id).to_json
    end

end