class Truck < ActiveRecord::Base
	validates_presence_of :licnum

	has_many :drivers
	has_one :trailer
	accepts_nested_attributes_for :trailer

	def select_label
		if self.nickname != (nil or '')
			return "#{self.licnum} (#{self.nickname})"
		else
			return "#{self.licnum}"
		end
	end

end
