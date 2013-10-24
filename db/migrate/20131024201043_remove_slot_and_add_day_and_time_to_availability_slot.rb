class RemoveSlotAndAddDayAndTimeToAvailabilitySlot < ActiveRecord::Migration
  def change
    remove_column :availability_slots, :slot, :integer
    add_column :availability_slots, :day, :string
    add_column :availability_slots, :time, :string
  end
end
