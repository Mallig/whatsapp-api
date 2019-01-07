require 'spec_helper'
require_relative '../../lib/app.rb'

url = 'http://localhost:9292/'

describe "WhatsAppUsers" do

    def app
        WhatsAppUsers.new
    end

    it "connects successfully" do
        get url
        expect(last_response).to be_ok
    end

    it "says hello world" do
        get url
        expect(last_response.body).to include("Hello World, from users API")
    end
end
