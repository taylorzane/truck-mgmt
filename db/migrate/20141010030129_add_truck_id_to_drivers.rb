class AddTruckIdToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :truck_id, :integer
  end
end
