require 'sinatra/base'
require './lib/link'

class BookmarkManager < Sinatra::Base

  get '/' do
    @link_address = "first_link"
    @link_name = "first_link"
    erb(:welcome)
  end

  run! if app_file == $0
end
