require './lib/users/user'
require './lib/data_mapper_setup'
require './lib/login/login_messages'
require './lib/response_messages'
require './spec/test_helper'

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
            post_with_headers "/login", parameters
            expect(JSON.parse(last_response.body)["message"]).to eq LoginMessages::SUCCESS
            expect(last_response.status).to eq 200
        end

        it "returns negative message when user gets something wrong" do
            parameters = {
                "username": "Mal",
                "password": "password1234"
            }.to_json
            post_with_headers "/login", parameters
            expect(JSON.parse(last_response.body)["message"]).to eq LoginMessages::FAILURE
            expect(last_response.status).to eq 200
        end

        it "returns messages saying nothing provided" do
            post_with_headers "/login", nil
            expect(JSON.parse(last_response.body)["message"]).to eq ResponseMessages::NOTHING_PROVIDED
            expect(last_response.status).to eq 200
        end
    end
end
