class CreateCourts < ActiveRecord::Migration
  def change
    create_table :courts do |t|
      t.string :type
      t.boolean :open
      t.references :location, index: true

      t.timestamps
    end
  end
end
