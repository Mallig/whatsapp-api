require 'data_mapper'
require 'dm-postgres-adapter'
require './lib/models/user'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/whatsapp_users_#{ENV['RACK_ENV']}")
DataMapper.finalize
