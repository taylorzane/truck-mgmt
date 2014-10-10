class CreateLoads < ActiveRecord::Migration
  def change
    create_table :loads do |t|
      t.integer :length
      t.integer :width
      t.integer :height
      t.integer :weight
      t.string :nickname

      t.timestamps
    end
  end
end
