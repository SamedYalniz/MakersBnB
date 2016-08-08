ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class MakersBnB < Sinatra::Base

  get '/' do
    'Hello MakersBnB!'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  get '/spaces' do
    @spaces= Space.all
    erb :'spaces/index'
  end

  post '/spaces' do
    Space.create(name: params[:SpaceName])
    redirect '/spaces'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
