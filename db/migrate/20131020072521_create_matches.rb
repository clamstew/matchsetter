class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :game_time
      t.references :court, index: true

      t.timestamps
    end
  end
end
