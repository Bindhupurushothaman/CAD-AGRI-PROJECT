class AddVeganToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :vegan, :boolean
  end
end
