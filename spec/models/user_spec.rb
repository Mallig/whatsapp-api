require './lib/models/user'
# require './db/setup_test_db'

describe User do
    before(:each) do
        # reset_table('whatsapp-test', 'users')
        # populate_users_table

        users = File.read('public/users.json')
        @users_json = JSON.parse(users)

        @test_user = '{
            "name": "test",
            "password": "secure123"
        }'
        @first_user_json = JSON.parse('{
            "id": "1",
            "name": "mal",
            "password": "secure123"
        }')
    end

    describe '.all' do
        it 'returns all users' do
            expect(User.all).to eq(@users_json["users"])
        end
    end

    describe '.find' do
        it 'returns its info as json' do
            expect(User.find(1)).to match(@first_user_json)
        end
    end

    describe '.create' do
        it 'returns a json of user in databse' do
            new_user = User.create(@test_user)
            test_user_with_id = {"id": "4"}.merge(JSON.parse(@test_user))
            expect(new_user).to eq(test_user_with_id)
        end
    end

    describe '.delete' do
        it 'sends a delete request to the database' do
            id = 1
            User.delete(id)
            expect(User.find(1)).to eq({error_message: "404 user not found"})
        end
    end
end
