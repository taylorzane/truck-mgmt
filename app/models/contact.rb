class Contact < ActiveRecord::Base
	validates_presence_of :name, :pass, :username
	validates_uniqueness_of :username
end
