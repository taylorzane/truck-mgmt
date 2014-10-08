class Contact < ActiveRecord::Base
  attribute :name, :validate => true
  attribute :pass, :validate => true
end
