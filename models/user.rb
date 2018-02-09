class User < ActiveRecord::Base
	has_many :questions
	has_secure_password
end

#https://medium.com/@tpstar/password-digest-column-in-user-migration-table-871ff9120a5