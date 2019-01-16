require 'sinatra'
require './lib/login/login_service'

class LoginController < Sinatra::Base

    before do
        content_type 'application/json'
    end

    post '/login' do
        req = request.body.read
        unless req == ""
            return LoginService.login(JSON.parse(req)).to_json
        end
        return nil
    end
end