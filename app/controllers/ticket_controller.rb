class TicketController < ApplicationController

    get '/tickets' do
        if logged_in? && current_user.admin?
            @tickets = Ticket.all
            erb :'/ticket/index'
        elsif logged_in?
            @tickets = Ticket.where(customer_id: session[:user_id])
            erb :'/ticket/index'
        else 
            redirect '/login'
        end 
    end 

    get '/tickets/new' do
        erb :'/ticket/new'
    end 

    post '/tickets' do 
        @ticket = current_user.submitted_tickets.build(params)
        if @ticket.save
            redirect '/tickets'
        else
            erb :'ticket/new'
        end 

    end 

end 