class SplitDatetimeToDateAndTime < ActiveRecord::Migration[5.1]
  def change
    # events
    rename_column :events, :start_at, :start_at_date
    change_column :events, :start_at_date, :date

    rename_column :events, :end_at, :end_at_date
    change_column :events, :start_at_date, :date

    add_column :events, :start_at_time, :time
    add_column :events, :end_at_time, :time

    # tasks
    rename_column :tasks, :start_from, :start_from_date
    change_column :tasks, :start_from_date, :date

    rename_column :tasks, :deadline, :deadline_date
    change_column :tasks, :deadline_date, :date

    add_column :tasks, :start_from_time, :time
    add_column :tasks, :deadline_time, :time
  end
end
