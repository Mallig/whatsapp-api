require 'sinatra'
require 'json'
require './lib/models/user'

class UsersController < Sinatra::Base

    user = User.new

    get '/users' do
        content_type :json
        user.all.to_json
    end

    get '/users/:id' do
        content_type :json

        id = params[:id].to_i
        user.find(id).to_json
    end

end