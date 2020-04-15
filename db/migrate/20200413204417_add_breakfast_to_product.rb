class AddBreakfastToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :breakfast, :boolean
  end
end
