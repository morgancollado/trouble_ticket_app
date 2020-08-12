class Admin < ActiveRecord::Base
    validates_uniqueness_of :username, case_senstive: false
    validates_uniqueness_of :email, case_senstive: false
    has_secure_password
end
