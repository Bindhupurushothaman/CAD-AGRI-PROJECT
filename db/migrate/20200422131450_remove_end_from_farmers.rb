class RemoveEndFromFarmers < ActiveRecord::Migration[5.2]
  def change
    remove_column :farmers, :end, :string
  end
end
