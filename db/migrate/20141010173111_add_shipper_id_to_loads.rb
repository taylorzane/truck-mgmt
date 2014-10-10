class AddShipperIdToLoads < ActiveRecord::Migration
  def change
    add_column :loads, :shipper_id, :integer
  end
end
