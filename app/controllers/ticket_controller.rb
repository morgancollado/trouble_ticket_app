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

    get '/tickets/:id/edit' do
        get_ticket
        if @ticket.customer == current_user 
            erb :'ticket/edit'
        elsif current_user.admin?
            erb :'ticket/admin_edit'
            redirect '/tickets'
        end 
    end

    patch '/tickets/:id' do 
        get_ticket
        if @ticket.customer == current_user || current_user.admin?
            resolved = params[:resolved?] == "true" ? true : false
            if @ticket.update(content: params[:content], title: params[:title], resolved?: resolved)
                redirect '/tickets'
            else 
                erb :'ticket/edit'
            end 
        else 
            redirect '/tickets'
        end 
    end 

    delete '/tickets/:id' do 
        get_ticket
        if @ticket.customer == current_user || current_user.admin?
            @ticket.delete
        end 
        redirect '/tickets'
    end 

    private

    def get_ticket
        @ticket = Ticket.find_by_id(params[:id])
    end 

end 