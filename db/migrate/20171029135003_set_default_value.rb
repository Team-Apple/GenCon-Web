class SetDefaultValue < ActiveRecord::Migration[5.1]
  def change
    change_column_default(
      :events,
      :priority,
      1
    )

    add_column :tasks, :priority, :integer, default: 1
  end
end
