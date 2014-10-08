class Contact < ActiveRecord::Base
  attr_accessible :name, :pass
  validates_presence_of :name, :pass
end
