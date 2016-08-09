ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class MakersBnB < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'


  get '/' do
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(first_name: params[:first_name],
                      last_name: params[:last_name],
                      email_address: params[:email_address],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    @user.save
    session[:user_id] = @user.id
    redirect to('/')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  get '/spaces' do
    @spaces= Space.all
    erb :'spaces/index'
  end

  post '/spaces' do
    Space.create(name: params[:SpaceName],description: params[:Description])
    redirect '/spaces'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
