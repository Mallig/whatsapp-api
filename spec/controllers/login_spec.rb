require 'spec_helper'
require './lib/users/user'
require './lib/login/login_messages'
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
            }.to_json
            post "/login", parameters
            expect(JSON.parse(last_response.body)["message"]).to eq LoginMessages::SUCCESS
        end

        it "returns negative message when user logs in" do
            parameters = {
                "username": "Mal",
                "password": "password1234"
            }.to_json
            post "/login", parameters
            expect(JSON.parse(last_response.body)["message"]).to eq LoginMessages::FAILURE
        end
    end
end
