class CreateBillings < ActiveRecord::Migration[5.2]
  def change
    create_table :billings do |t|
      t.decimal :subtotal
      t.decimal :total
      t.decimal :tax
      t.decimal :shipping

      t.timestamps
    end
  end
end
