require 'sinatra'
require 'json'
require './lib/models/user'

class UsersController < Sinatra::Base

    before do
        response['Access-Control-Allow-Origin'] = '*'
        content_type 'application/json'
    end

    get '/users' do
        User.all.to_json
    end

    post '/users' do
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
        id = params[:id]
        user = User.first(:id => id)
        user.destroy.to_json
    end
    
    get '/users/:id' do
        User.first(:id => params[:id]).to_json
    end
end
