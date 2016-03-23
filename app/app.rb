require 'sinatra/base'
require_relative './models/link'
require_relative './models/data_mapper_setup'

class BookmarkManager < Sinatra::Base

  ENV['RACK_ENV'] ||= 'development'

  get '/' do
    erb(:hello)

  end

  post '/links' do
    link = Link.create(link_address: params[:link_address], link_name: params[:link_name])
    tag = Tag.create(tag: params[:link_tag])
    link.tags << tag
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

  run! if app_file == $0
end
