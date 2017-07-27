class SplitDatetimesOfEvent < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :start_at, :datetime
    remove_column :events, :end_at, :datetime
    add_column :events, :start_at_date, :date
    add_column :events, :start_at_time, :time
    add_column :events, :end_at_date, :date
    add_column :events, :end_at_time, :time
  end
end
