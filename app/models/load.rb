class Load < ActiveRecord::Base
	validates_presence_of :length, :width, :height, :weight, :nickname, :shipper_id

	belongs_to :trailer
	belongs_to :shipper

end
