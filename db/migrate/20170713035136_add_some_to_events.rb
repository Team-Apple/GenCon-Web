class AddSomeToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :start_at, :datetime
    add_column :events, :end_at, :datetime
    add_column :events, :memo, :string
  end
end
