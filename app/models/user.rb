class User < ActiveRecord::Base
    validates_uniqueness_of :username, case_senstive: false
    validates_uniqueness_of :email, case_senstive: false
    has_secure_password
    has_many :worked_tickets, :class_name => "Ticket", :foreign_key => "admin_id"
    has_many :submitted_tickets, :class_name => "Ticket", :foreign_key => "customer_id"
    validates_presence_of :username, :email
end
