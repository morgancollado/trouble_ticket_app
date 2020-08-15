class UserController < ApplicationController

    get "/login" do 
        erb :'users/login'
    end 

    post "/login" do
        
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect '/tickets'
        else 
            #flash[:error] = "Invalid credentials. Try again!"
            redirect '/login'
        end
    end 

    get "/signup" do 
        erb :'users/signup'
    end 

    post "/signup" do 
        if params[:username].empty || params[:email].empty? || params[:password].empty?
           # @error = "All fields must be completed"
            erb :'/users/signup'
        else 
        @user = User.create(username: params[:username], email: params[:email], password: params[:password])
        session[:user_id] = @user.id

        redirect '/tickets'
        end 
    end 

    get "/logout" do 
        session.clear
        redirect '/'
    end 



end 

# if current_user user.admin?  