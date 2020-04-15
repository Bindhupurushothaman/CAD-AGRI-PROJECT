class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, default: ''
      t.decimal :price, default: 0.0
      t.string :quantity, default: false
      t.string :status, default: false
      t.string :photo, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
