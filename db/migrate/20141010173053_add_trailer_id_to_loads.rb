class AddTrailerIdToLoads < ActiveRecord::Migration
  def change
    add_column :loads, :trailer_id, :integer
  end
end
