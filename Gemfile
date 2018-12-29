source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

group :production, :development, :test do
    gem 'sinatra'
    gem 'json'
    gem 'pg'
end

group :development, :test do
    gem 'rspec'
    gem 'rack-test'
end
