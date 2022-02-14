require 'sinatra/base'
require 'sinatra/reloader'




class Bookmark_manager < Sinatra::Base 
  configure :development do 
    register Sinatra::Reloader 
  end
  

  get '/' do
    'Bookmark Manager'
  end
  run! if app_file == $0
end