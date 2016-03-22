require 'sinatra/base'
require_relative 'models/data_mapper_setup'

class Bookmark_Manager < Sinatra::Base

  enable :sessions
  ENV["RACK_ENV"] ||= "development"

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.create(tag: params[:tag])
    link.tags << tag
    link.save
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
