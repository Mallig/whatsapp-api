require 'sinatra'
require 'json'
require './lib/models/user'

class UsersController < Sinatra::Base

    before do
        response['Access-Control-Allow-Origin'] = '*'
        content_type 'application/json'
    end

    get '/users' do
        blah = [
            {
                :username => "Jon",
                :password => "password123"
            },
            {
                :username => "Toby",
                :password => "password123"
            },
            {
                :username => "Ellie",
                :password => "password123"
            },
            {
                :username => "Theresa",
                :password => "password123"
            },
            {
                :username => "Mal",
                :password => "password123"
            },
            {
                :username => "Hugo",
                :password => "password123"
            },
            {
                :username => "Johnson",
                :password => "password123"
            },
            {
                :username => "Jason",
                :password => "password123"
            },
            {
                :username => "Jimothy",
                :password => "password123"
            }
        ]

        if ENV['RACK_ENV'] != 'test'
            blah.each do |user|
                User.create(
                    :username => user[:username],
                    :password => user[:password]
                )
            end
        end
        users = []
        User.all(:fields => [:id, :username]).each do |user|
            users.push(translate_user(user))
        end
        users.to_json
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
        user = User.first(:id => params[:id], :fields => [:id, :username])
        res = translate_user(user)
        user.destroy
        return res.to_json
    end
    
    get '/users/:id' do
        user = User.first(:id => params[:id], :fields => [:id, :username])
        translate_user(user).to_json
    end

    private

    def translate_user(user)
        return {
            :id => user[:id],
            :username => user[:username]
        }
    end
end
