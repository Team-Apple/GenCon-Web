class CreateAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :announcements do |t|
      t.string :title
      t.date :date
      t.boolean :timing, default: true
      t.integer :mode, default: 0

      t.timestamps
    end
  end
end
