class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :start_from
      t.datetime :deadline
      t.string :memo

      t.timestamps
    end
  end
end
