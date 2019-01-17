require './lib/users/user'

module UserService
    class << self
        def find_all_users
            users = []
            User.all(:fields => [:id, :username]).each do |user|
                users.push(translate_user(user))
            end
            users.to_json
        end

        def add_user(user)
            new_or_existing_user = User.create(
                :username => user["username"],
                :password => user["password"]
            )
            if new_or_existing_user.saved?
                return {
                    :id => new_or_existing_user.id,
                    :username => new_or_existing_user.username
                }.to_json
            else
                {:saved => false}.to_json 
            end
        end

        def find_user(id)
            user = User.first(:id => id, :fields => [:id, :username])
            translate_user(user).to_json
        end

        def remove_user(id)
            user = User.first(:id => id, :fields => [:id, :username])
            res = translate_user(user)
            user.destroy
            res.to_json
        end
        
        private

        def translate_user(user)
            return {
                :id => user[:id],
                :username => user[:username]
            }
        end
    end
end