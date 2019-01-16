require 'sinatra'

class SecureController < Sinatra::Base
    before do
        headers "Content-Type" => 'application/json'
        halt 403 unless request.env["Content-Type"] == 'application/json'
    end
end
