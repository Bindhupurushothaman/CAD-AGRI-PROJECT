class AddFeaturedToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :featured, :boolean
  end
end
