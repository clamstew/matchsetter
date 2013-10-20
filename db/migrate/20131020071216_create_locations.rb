class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :state
      t.string :city
      t.string :zip

      t.timestamps
    end
  end
end