class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_pic, :string
    add_column :users, :first_name, :string
    add_column :users, :last_namezip, :string
    add_column :users, :skillset, :float
    add_column :users, :age, :integer
    add_column :users, :rating, :float
    add_column :users, :gender, :string
  end
end
