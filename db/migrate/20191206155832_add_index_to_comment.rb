class AddIndexToComment < ActiveRecord::Migration[5.2]
  def change
    add_index :comments, :reply_comment_id
  end
end
