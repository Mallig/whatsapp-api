require 'spec_helper'
require_relative '../../lib/controllers/users'


describe "UsersController" do
    before(:each) do
        users = File.read('public/users.json')
        @users_json = JSON.parse(users)
    end

    def app
        UsersController.new
    end

    describe "GET /users" do
        it "connects successfully" do
            get 'http://localhost:9292/users'
            expect(last_response).to be_ok
        end

        it "returns a list of users" do
            get 'http://localhost:9292/users'
            expect(JSON.parse(last_response.body)).to match(@users_json["users"])
        end

        describe "GET /:id" do
            before(:each) do
                @user_json = @users_json["users"][0]
            end

            it "conneccts successfully" do
                get 'http://localhost:9292/users/1'
                expect(last_response).to be_ok
            end

            it "returns details about a single user" do
                get 'http://localhost:9292/users/1'
                expect(JSON.parse(last_response.body)).to match(@user_json)
            end
        end
    end

    describe "POST /users" do
        before(:each) do
            @user = { "name": "tommy", "password": "rockon"}
            @user_json = JSON.parse('{ "name": "tommy", "password": "rockon", "id": "4"}')
        end

        it "connects successfully" do
            post 'http://localhost:9292/users', @user
            expect(last_response).to be_ok
        end

        it "adds a user to the database" do
            post 'http://localhost:9292/users', @user
            
            get 'http://localhost:9292/users/4'
            expect(JSON.parse(last_response.body)).to eq @user_json
        end
    end

end
