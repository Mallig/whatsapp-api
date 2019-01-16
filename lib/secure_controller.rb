require 'sinatra'

class SecureController < Sinatra::Base
    before do
        headers "Content-Type" => "application/json"
        halt 403 unless request.env["CONTENT_TYPE"] == "application/json" || request.env["Content-Type"] == "application/json"
    end
end
