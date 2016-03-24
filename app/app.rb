ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './models/data_mapper_setup'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb(:hello)
  end

  get '/sign_up/register' do
    erb :'/user/sign_up'
  end

  post '/sign_up' do
    user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/links'
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'/user/sign_up'
    end
  end

  post '/links' do
    link = Link.first_or_create(link_address: params[:link_address], link_name: params[:link_name])
    params[:link_tag].split.each do |tag|
      link.tags << Tag.first_or_create(tag: tag)
    end
    link.save
    redirect('/links')
  end

  get '/links' do
    @links = Link.all
    @tags = Tag.all
    erb(:'links/links')
  end

  get '/links/new' do
    erb(:'links/add_link')
  end

  get '/tags/:link_tag' do
    tag = Tag.first(tag: params[:link_tag])
    @links = tag ? tag.links : []
    erb(:'links/links')
  end

  run! if app_file == $0
end
