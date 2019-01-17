require './lib/secure_controller'
require './lib/users/user_service'

class UsersController < SecureController
    get '/users' do
        UserService.find_all_users
    end

    post '/users' do
        UserService.add_user(JSON.parse(request.body.read))
    end
    
    get '/users/:id' do
        UserService.find_user(params[:id])
    end

    delete '/users/:id' do
        UserService.remove_user(params[:id])
    end
end
