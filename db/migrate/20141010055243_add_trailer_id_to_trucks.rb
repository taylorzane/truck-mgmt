class AddTrailerIdToTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :trailer_id, :integer
  end
end
