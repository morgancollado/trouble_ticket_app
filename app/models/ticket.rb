class Ticket < ActiveRecord::Base
    belongs_to :customer, :class_name => "User"
    belongs_to :admin, :class_name => "User"
    validates_presence_of :title, :content 

end
