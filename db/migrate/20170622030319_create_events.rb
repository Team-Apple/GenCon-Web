class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.datetime :notif_at
      t.boolean :repeat
      t.integer :repeat_value
      t.integer :repeat_unit
      t.integer :api_id

      t.timestamps
    end
  end
end
