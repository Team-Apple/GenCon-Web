class RemoveSomeFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :notif_at, :date
    remove_column :events, :repeat, :bool
    remove_column :events, :repeat_value, :integer
    remove_column :events, :repeat_unit, :integer
    remove_column :events, :api_id, :integer
  end
end
