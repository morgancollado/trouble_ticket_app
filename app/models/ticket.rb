class Ticket < ActiveRecord::Base
    belongs_to :user
    belongs_to :admin
    validates_presence_of :title, :content 
end
