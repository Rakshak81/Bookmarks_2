require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class Bookmark_manager < Sinatra::Base 
  configure :development do 
    register Sinatra::Reloader 
  end
  

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/add_bookmarks' do
    url_param = params['url']
    title_param = params['title']
    Bookmark.create(url_param, title_param)
    redirect '/bookmarks'
  end 

  run! if app_file == $0
end