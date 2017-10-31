class FixTypo < ActiveRecord::Migration[5.1]
  def change
    change_column :events, :end_at_date, :date
  end
end
