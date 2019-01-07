require 'spec_helper'
require_relative '../../lib/app.rb'

describe "WhatsAppUsers" do

    def app
        WhatsAppUsers.new
    end

    it "connects successfully" do
        get 'http://localhost:9292/'
        expect(last_response).to be_ok
    end

    it "says hello world" do
        get 'http://localhost:9292/'
        expect(last_response.body).to include("Hello World, from users API")
    end

end
