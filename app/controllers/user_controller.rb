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
             flash[:error] = "Invalid credentials. Try again!"
            redirect '/login'
        end
    end 

    get "/signup" do 
        erb :'users/signup'
    end 

    post "/signup" do 
        if params[:username].empty? || params[:email].empty? || params[:password].empty?
           flash[:error] = "All fields must be completed"
            redirect '/signup'
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

    get '/admin' do
        if current_user.admin?
            @users = User.where(admin?: false)
            erb :'users/admin'
        else
            flash[:error] = "You do not have permission to access this page!"
        end 
    end 

    patch '/user' do 
        @user = User.find_by_id(params[:user])
        @user.update(admin?: true)
        flash[:success] = "You have successfully created a new Administrator!"
        redirect '/tickets'
    end 



end 

# if current_user user.admin?  