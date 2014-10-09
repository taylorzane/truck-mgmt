class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :pass, null: false
      t.string :username, null: false
      t.timestamps
    end
  end
end
