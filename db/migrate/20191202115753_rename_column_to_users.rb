class RenameColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :grade, :user_grade
  end
end
