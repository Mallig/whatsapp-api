require 'spec_helper'
require_relative '../../lib/controllers/users'


describe "Users" do
    before(:each) do
        users = File.read('public/users.json')
        @users_json = JSON.parse(users)
    end

    def app
        Users.new
    end

    describe "GET /users" do
        it "connects successfully" do
            get 'http://localhost:9292/users'
            expect(last_response).to be_ok
        end

        it "returns a list of users" do
            get 'http://localhost:9292/users'
            expect(JSON.parse(last_response.body)).to match(@users_json)
        end

        describe "GET /:id" do
            before(:each) do
                @user_json = @users_json["users"][0]
                # @user_json = JSON.parse(user)
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

end
