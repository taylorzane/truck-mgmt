class CreateTrailers < ActiveRecord::Migration
  def change
    create_table :trailers do |t|
      t.string :licnum
      t.string :nickname
      t.integer :length
      t.integer :width
      t.integer :height
      


      t.timestamps
    end
  end
end
