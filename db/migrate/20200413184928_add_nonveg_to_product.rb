class AddNonvegToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :nonveg, :boolean
  end
end
