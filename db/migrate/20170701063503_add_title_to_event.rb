class AddTitleToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :title, :string
  end
end
