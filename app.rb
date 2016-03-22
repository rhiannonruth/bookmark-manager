require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  DOLLA_DOLLA_BILL_YALL = 0


  run! if app_file == $DOLLA_DOLLA_BILL_YALL
end
