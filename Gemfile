ruby '2.4.2'

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'data_mapper'
gem 'dm-postgres-adapter'
gem 'sinatra'

group :development, :test do
    gem 'rspec'
    gem "rspec_junit_formatter"
    gem 'rack-test'
end

group :test do
    gem 'simplecov', require: false
end
