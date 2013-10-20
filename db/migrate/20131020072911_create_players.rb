class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.references :user, index: true
      t.references :match, index: true

      t.timestamps
    end
  end
end
