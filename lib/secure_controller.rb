require 'sinatra'

class SecureController < Sinatra::Base
    before do
        headers "Content-Type" => "application/json"
        headers_present = request.env["CONTENT_TYPE"] == "application/json" ||
                            request.env["Content-Type"] == "application/json"
        halt 403 unless headers_present
    end
end
