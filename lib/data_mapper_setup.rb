require 'data_mapper'
require './lib/models/user'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/whatsapp_#{ENV['RACK_ENV']}")
DataMapper.finalize
