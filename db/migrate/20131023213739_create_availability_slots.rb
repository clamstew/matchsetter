class CreateAvailabilitySlots < ActiveRecord::Migration
  def change
    create_table :availability_slots do |t|
      t.references :user, index: true
      t.integer :slot

      t.timestamps
    end
  end
end
