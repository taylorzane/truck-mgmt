class Shipper < ActiveRecord::Base
	validates_presence_of :name

	has_many :loads

end
