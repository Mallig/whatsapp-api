require 'sinatra'
require 'json'
require './lib/models/user'

class UsersController < Sinatra::Base

    get '/users' do
        content_type :json
        
        user = User.new
        user.all.to_json
    end

    post '/users' do

    end
    
    get '/users/:id' do
        content_type :json
        user = User.new

        id = params[:id].to_i
        user.find(id).to_json
    end

end