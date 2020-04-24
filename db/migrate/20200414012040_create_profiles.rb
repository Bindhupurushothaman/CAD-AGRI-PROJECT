class CreateProfiles < ActiveRecord::Migration[5.2]
	
  def change
    create_table :profiles do |t|
      t.string :firstname, null: false, default: ""
      t.string :lastname, null: false, default: ""
      t.string :address, null: false, default: ""
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
