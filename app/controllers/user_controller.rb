class UserController < ApplicationController

    get "/user/login" do 
        erb :'user/login'
    end 

    get "/user/signup" do 
        erb :'user/signup'

    end 



end 