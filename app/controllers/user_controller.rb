class UserController < ApplicationController

    get "/user/login" do 
        erb :'user/login'
    end 

    post "/user/login" do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect '/user/home'
        else 
            redirect '/user/login'
        end
    end 

    get "/user/signup" do 
        erb :'user/signup'
    end 

    post "/user/signup" do 
        @user = User.create(username: params[:username], email: params[:email], password: params[:password])
        session[:user_id] = @user.id

        redirect 'user/home'
    end 

    get "/user/home" do 
        erb :'user/home'
    end 



end 