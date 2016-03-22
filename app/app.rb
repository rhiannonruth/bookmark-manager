require 'sinatra/base'
require_relative './models/link'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb(:hello)
  end

  get '/links' do
    @links = Link.all
    erb(:'links/links')
  end

  get '/links/new' do
    erb(:'links/add_link')
  end

  run! if app_file == $0
end
