class AddLoadIdToTrailers < ActiveRecord::Migration
  def change
    add_column :trailers, :load_id, :integer
  end
end
