class Trailer < ActiveRecord::Base
	validates_presence_of :licnum, :length, :width, :height

	belongs_to :truck
	has_many :loads

	def select_label
		if self.nickname != (nil or '')
			return "#{self.licnum} (#{self.nickname})"
		else
			return "#{self.licnum}"
		end
	end

end
