ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class MakersBnB < Sinatra::Base
  set :public_folder, Proc.new { File.join(root, 'public') }

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::MethodOverride
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(first_name: params[:first_name],
                       last_name: params[:last_name],
                      email_address: params[:email_address],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if @user.save
    session[:user_id] = @user.id
    redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(params[:email_address], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/spaces'
    else
      @email = params[:email_address]
      flash.now[:errors] = ["Email or password is incorrect"]
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect to '/'
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
    @spaces = Space.all
    erb :'spaces/index'
  end

  post '/spaces' do
     @user = current_user
     space = Space.create(name: params[:SpaceName],
                description: params[:Description],
                price: params[:Price],
                available_from: params[:Available_from],
                available_to: params[:Available_to])
    @user.spaces << space
    space.user = @user
    space.save
    @user.save
    redirect '/spaces'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
