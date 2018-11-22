require 'spec_helper'
require_relative '../../app.rb'

describe "WhatsAppAPI" do

    def app
        WhatsAppAPI.new
    end

    it "connects successfully" do
        get 'http://localhost:9292/'
        expect(last_response).to be_ok
    end

    it "says hello world" do
        get 'http://localhost:9292/'
        expect(last_response.body).to include("Hello World, from API")
    end

end