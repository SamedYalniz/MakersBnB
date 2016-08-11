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



  get '/spaces/new' do
    @user = current_user
    if @user
      erb :'spaces/new'
    else
      flash.keep[:errors] = ["Please sign in to list a space"]
      redirect '/spaces'
    end
  end


  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end


  post '/spaces/space' do
    @space = Space.first(id: params[:space])
    session[:space_id] = @space.id
    redirect '/spaces/space'
  end

  get '/spaces/space' do
    @space = current_space
    erb :'spaces/space'
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

  post '/requests' do
    @space = Space.first(id: params[:space])
    request = Request.create(date: params[:calender])
    request.space = @space
    @space.requests << request
    @space.save
    @user = current_user
    request.user = @user
    request.save
    @user.requests << request
    @user.save
    session[:user_id] = @user.id
    session[:space_id] = @space.id
    flash.keep[:request] = 'The request to book has been delivered'
    redirect '/requests'
  end

  get '/requests' do
   @user = current_user
   @space = current_space
    erb :'requests/index'
  end

  post '/requests/request' do
    @request = Request.get(params[:request])
    session[:request_id] = @request.id
    redirect '/requests/request'
  end

  get '/requests/request' do
    @request = current_request
    erb :'requests/request'
  end


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def current_space
      @current_space ||= Space.get(session[:space_id])
    end

    def current_request
      @current_request ||= Request.get(session[:request_id])
    end
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
