class RemoveLastNameZipFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :last_namezip
  end
end
