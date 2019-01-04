require 'data_mapper'
class User
    include DataMapper::Resource

    property :id,           Serial
    property :username,     String,     :required => true
    property :password,     Text

end
