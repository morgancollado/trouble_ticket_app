class Admin < ActiveRecord::Base
    validates_uniqueness_of :username, case_senstive: false
    validates_uniqueness_of :email, case_senstive: false
    has_secure_password
    has_many :tickets
    validates_presence_of :username, :email, :password
end
