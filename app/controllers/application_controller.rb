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
    erb :welcome
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

#for get 
#if current_user.admin? 
# @tickets = tickets.all 
#else 
# @tickets = current_user.tickets

#for  get edit and patch edit  
# if current_user.admin? || @ticket.user == current_user 
#erb :'/ticket/:id/edit'
