class AddPriorityToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :priority, :integer
  end
end
