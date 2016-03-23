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
    params[:link_tag].split.each do |tag|
      link.tags << Tag.create(tag: tag)
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
