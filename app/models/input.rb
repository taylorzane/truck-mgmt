class Input < ActiveRecord::Base
	attr_accessible :name, :pass
	validates_precense_of :name, :pass
end