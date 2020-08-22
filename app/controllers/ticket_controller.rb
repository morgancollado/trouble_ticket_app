class TicketController < ApplicationController

    get '/tickets' do
        if logged_in? && current_user.admin?
            @tickets = Ticket.where(resolved?: false)
            erb :'/tickets/index'
        elsif logged_in?
            @tickets = Ticket.where(customer_id: session[:user_id])
            erb :'/tickets/index'
        else 
            redirect '/login'
        end 
    end 

    get '/tickets/new' do
        erb :'/tickets/new'
    end 

    post '/tickets' do 
        @ticket = current_user.submitted_tickets.build(params)
        if @ticket.save
            redirect '/tickets'
        else
            erb :'tickets/new'
        end 
    end 

    get '/tickets/:id' do 
        get_ticket
        if @ticket.customer == current_user || current_user.admin?
            erb :'tickets/show'
        else 
            redirect "/tickets"
        end 

    end 

    get '/tickets/:id/edit' do
        get_ticket
        if @ticket.customer == current_user 
            erb :'tickets/edit'
        elsif current_user.admin?
            erb :'tickets/admin_edit'
        else
            redirect '/tickets'
        end 
    end

    patch '/tickets/:id' do 
        get_ticket
        if @ticket.customer == current_user || current_user.admin?
            if current_user.admin? 
                current_user.worked_tickets << @ticket
            end
            resolved = params[:resolved?] == "true" ? true : false
            if @ticket.update(content: params[:content], title: params[:title], resolved?: resolved, admin_response: params[:admin_response])
                
                redirect '/tickets'
            else 
                erb :'tickets/edit'
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