class AddLoadIdToShippers < ActiveRecord::Migration
  def change
    add_column :shippers, :load_id, :integer
  end
end
