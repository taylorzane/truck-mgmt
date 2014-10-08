class Contact < ActiveRecord::Base
  params.require(:contact).permit(:name, :pass)
  validates_presence_of :name, :pass
end
