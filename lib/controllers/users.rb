require 'sinatra'
require 'json'

class Users < Sinatra::Base

    file = File.read('public/users.json')
    data_hash = JSON.parse(file)

    get '/users' do
        content_type :json
        data_hash.to_json
    end

    get '/users/:id' do
        id = params[:id].to_i

        data_hash["users"].each do |user|
            if (user["id"] == id)
                return user.to_json
            end
        end
    end

end