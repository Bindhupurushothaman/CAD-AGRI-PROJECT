class AddForSaleToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :for_sale, :boolean
  end
end
