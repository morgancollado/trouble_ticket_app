require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash
    set :session_secret, ENV['SESSION_SECRET']
    
  end

  get "/" do
    if logged_in? 
      redirect '/tickets'
    else 
    erb :welcome
    end 
  end

  helpers do

    def current_user
      @current_user ||=User.find(session[:user_id]) if session[:user_id]
    end 

    def logged_in?
      !!current_user
    end  
 end 

end


