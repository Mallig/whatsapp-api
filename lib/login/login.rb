require 'sinatra'

class LoginController < Sinatra::Base

    before do
        content_type 'application/json'
    end

    post '/login' do
        req = request.body.read
        unless req == ""
            body = JSON.parse(req)
            return body.to_json
        end
        return nil
    end
end