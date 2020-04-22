class CreateFarmers < ActiveRecord::Migration[5.2]
  def change
    create_table :farmers do |t|
      t.string :serial
      t.string :state
      t.string :year2011
      t.string :year2012
      t.string :year2013
      t.string :year2014
      t.string :end
      t.string :working

      t.timestamps
    end
  end
end
