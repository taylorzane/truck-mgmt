class CreateTrucks < ActiveRecord::Migration
  def change
  	create_table :trucks do |t|
      t.string :licnum
      t.string :nickname
      

      t.timestamps
    end
  end
end
