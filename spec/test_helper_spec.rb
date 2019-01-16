require 'spec_helper'
require './spec/test_helper'

describe 'Testing the test helper' do
    before do
        user = User.create(:username => "test_user", :password => "password")
        expect(user.saved?).to be true
    end

    it 'should destroy everyone from the database' do
        clear_users
        expect(User.first).to be nil
    end
end
