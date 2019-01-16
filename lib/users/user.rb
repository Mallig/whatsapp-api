require 'data_mapper'
class User
    include DataMapper::Resource

    property :id,           Serial
    property :username,     String,     :required => true,      :unique => true
    property :password,     Text,       :required => true

end
