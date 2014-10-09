class CreateTestenvs < ActiveRecord::Migration
  def change
    create_table :testenvs do |t|

      t.timestamps
    end
  end
end
