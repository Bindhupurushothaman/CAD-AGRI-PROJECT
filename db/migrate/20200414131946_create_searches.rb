class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :food
      t.string :category
      t.decimal :min_price
      t.decimal :max_price
      t.string :for_sale

      t.timestamps
    end
  end
end
