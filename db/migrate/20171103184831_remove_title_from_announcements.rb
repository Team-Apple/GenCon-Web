class RemoveTitleFromAnnouncements < ActiveRecord::Migration[5.1]
  def change
    remove_column :announcements, :title
  end
end
