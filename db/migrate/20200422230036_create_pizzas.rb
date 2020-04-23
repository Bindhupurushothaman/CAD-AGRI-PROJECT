class CreatePizzas < ActiveRecord::Migration[5.2]
  def change
    create_table :pizzas do |t|
      t.string :name
      t.decimal :cost
      t.string :description
      t.string :size

      t.timestamps
    end
  end
end
