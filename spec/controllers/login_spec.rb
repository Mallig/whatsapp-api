require 'spec_helper'
require './lib/users/user'
require './lib/data_mapper_setup'

describe "LoginController" do

    def app
        LoginController.new
    end

    before do
        DataMapper.auto_migrate!
        User.create(:username => "Mal", :password => "password123")
    end

    describe "POST /login" do
        it "returns positive message when user logs in" do
            parameters = {
                "username": "Mal",
                "password": "password123"
            }
            post "/login", parameters.to_json, {"CONTENT_TYPE" => 'application/json'}
            expect(JSON.parse(last_response.body)["message"]).to include "Hooray"
        end

        it "returns negative message when user logs in" do
            parameters = {
                "username": "Mal",
                "password": "password1234"
            }
            post "/login", parameters.to_json, {"CONTENT_TYPE" => 'application/json'}
            expect(JSON.parse(last_response.body)["message"]).to eq "you got something wrong mate"
        end
    end


end
