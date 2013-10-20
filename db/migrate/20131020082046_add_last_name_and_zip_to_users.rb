class AddLastNameAndZipToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_name, :string
    add_column :users, :zip, :string
  end
end
