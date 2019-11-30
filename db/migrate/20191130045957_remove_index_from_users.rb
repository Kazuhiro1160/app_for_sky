class RemoveIndexFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, column: :email, name: 'index_users_on_email'
  end
end
