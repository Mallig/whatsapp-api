require './lib/models/user'
require './db/setup_test_db'

describe User do
    before(:each) do
        @user = User.new
        
        reset_table('whatsapp-test', 'users')
        populate_users_table

        users = File.read('public/users.json')
        @users_json = JSON.parse(users)
    end

    describe '.all' do
        it 'returns all users' do
            expect(@user.all).to eq(@users_json["users"])
        end
    end

    describe '.find' do
        before(:each) do
            @mal_json = JSON.parse('{
                "id": "1",
                "name": "mal",
                "password": "secure123"
            }')
        end

        it 'returns its info as json' do
            mal = @user.find(1).to_json
            expect(@user.find(1)).to match(@mal_json)
        end
    end
end