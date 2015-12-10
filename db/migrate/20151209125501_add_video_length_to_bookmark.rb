class AddVideoLengthToBookmark < ActiveRecord::Migration
  def change
    add_column :bookmarks, :video_length, :integer, null: false
  end
end
