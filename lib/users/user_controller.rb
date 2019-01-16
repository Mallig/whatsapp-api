require './lib/secure_controller'
require './lib/users/user_service'

class UsersController < SecureController
    get '/users' do
        UserService.all_users
    end

    post '/users' do
        UserService.create(JSON.parse(request.body.read))
    end
    
    get '/users/:id' do
        UserService.first(params[:id])
    end

    delete '/users/:id' do
        UserService.delete(params[:id])
    end
end
