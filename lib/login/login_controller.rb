require 'sinatra'
require './lib/response_messages'
require './lib/login/login_service'

class LoginController < Sinatra::Base

    before do
        content_type 'application/json'
    end

    post '/login' do
        req = request.body.read
        if req != ""
            return LoginService.login(JSON.parse(req)).to_json
        else
            return {:message => ResponseMessages::NOTHING_PROVIDED}.to_json
        end
    end
end
