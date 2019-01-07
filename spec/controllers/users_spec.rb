require 'spec_helper'
require_relative '../../lib/controllers/users'
require './db/test_db_helpers'


describe "UsersController" do
    before(:each) do
        get_users = File.read('spec/mock_responses/get_users.json')
        @users_json = JSON.parse(get_users)
        DataMapper.auto_migrate!
        populate_users
    end

    def app
        UsersController.new
    end

    describe "GET /users" do
        it "connects successfully" do
            get '/users'
            expect(last_response).to be_ok
        end

        it "returns a list of users without the password" do
            get '/users'
            expect(JSON.parse(last_response.body)).to eq(@users_json["users"])
        end

        describe "GET /:id" do
            before(:each) do
                @user_json = @users_json["users"][0]
            end

            it "connects successfully" do
                get '/users/1'
                expect(last_response).to be_ok
            end

            it "returns details about a single user" do
                get '/users/1'
                expect(JSON.parse(last_response.body)).to match(@user_json)
            end
        end
    end

    describe "POST /users" do
        before(:each) do
            @user = { "username": "tommy", "password": "rockon" }
            @user_json = JSON.parse('{ "username": "tommy", "password": "rockon", "id": "4" }')
        end

        it "connects successfully" do
            post '/users', @user.to_json, {"CONTENT_TYPE" => "application/json"}
            expect(last_response).to be_ok
        end

        it "adds a user to the database" do
            post '/users', @user.to_json, {"CONTENT_TYPE" => "application/json"}
            
            get '/users/4'
            expect(JSON.parse(last_response.body)).to eq @user_json
        end

        it "displays the new user details" do
            post '/users', @user.to_json, {"CONTENT_TYPE" => "application/json"}
            expect(JSON.parse(last_response.body)).to eq @user_json
        end
    end

    describe "DELETE /users/:id" do
        before(:each) do
            @user = { "name": "mal", "password": "secure123" }
            @user_json = JSON.parse('{ "id": "1", "name": "mal", "password": "secure123" }')
        end

        it "connects successfully" do
            delete '/users/1'
            expect(last_response).to be_ok
        end

        it "returns db row as json" do
            delete '/users/1'
            expect(JSON.parse(last_response.body)).to eq @user_json
        end
    end
end
