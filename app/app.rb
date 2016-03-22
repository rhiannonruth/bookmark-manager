require 'sinatra/base'
require_relative './models/link'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb(:hello)
  end


  get '/links' do
    Link.create(link_address: "first_link", link_name: "this is the first link")
      puts Link.get(1)
    @link_address = "first_link"
    @link_name = Link.get(1)
    erb(:welcome)
  end

  run! if app_file == $0
end
