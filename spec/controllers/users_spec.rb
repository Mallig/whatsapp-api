require 'spec_helper'
require './spec/test_helper'

describe "UsersController" do
    before(:each) do
        @headers = {'Content-Type' => 'application/json'}
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
            get_with_headers '/users'
            expect(last_response).to be_ok
        end

        it "returns a list of users without the password" do
            get_with_headers '/users'
            expect(JSON.parse(last_response.body)).to eq(@users_json["users"])
        end

        describe "GET /:id" do
            before(:each) do
                @user_json = @users_json["users"][0]
            end

            it "connects successfully" do
                get_with_headers '/users/1'
                expect(last_response).to be_ok
            end

            it "returns details about a single user" do
                get_with_headers '/users/1'
                expect(JSON.parse(last_response.body)).to match(@user_json)
            end
        end
    end

    describe "POST /users" do
        before(:each) do
            @post_user = File.read('spec/mock_responses/post_user.json')
            @post_invalid_user = File.read('spec/mock_responses/post_invalid_user.json')
            @user_json = JSON.parse('{ "id": 4, "username": "tommy"}')
        end

        context 'when passed valid data' do
            it "connects successfully" do
                post_with_headers '/users', @post_user
                expect(last_response).to be_ok
            end

            it "adds a user to the database" do
                post_with_headers '/users', @post_user
                
                get_with_headers '/users/4'
                expect(JSON.parse(last_response.body)).to eq @user_json
            end

            it "displays the new user details" do
                post_with_headers '/users', @post_user
                expect(JSON.parse(last_response.body)).to eq @user_json
            end
        end

        context 'when passed invalid data' do
            it 'returns failed save json' do
                post_with_headers '/users', @post_invalid_user
                expect(JSON.parse(last_response.body)).to eq(JSON.parse({:saved => false}.to_json))
            end
        end
    end

    describe "DELETE /users/:id" do
        before(:each) do
            @user_json = JSON.parse('{ "id": 1, "username": "mal" }')
        end

        it "connects successfully" do
            delete '/users/1', nil, @headers
            expect(last_response).to be_ok
        end

        it "returns db row as json" do
            delete '/users/1', nil, @headers
            expect(JSON.parse(last_response.body)).to eq @user_json
        end
    end
end
