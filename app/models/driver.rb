class Driver < ActiveRecord::Base
	validates_presence_of :fname, :lname, :licnum, :dob

	belongs_to :truck

end
