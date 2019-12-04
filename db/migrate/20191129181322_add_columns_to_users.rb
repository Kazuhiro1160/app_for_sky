class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :login_id, :string, null: false, default: ""
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :sex, :string
    add_column :users, :grade, :integer, default: 1
    add_column :users, :pass_fog, :boolean, default: 1
    add_column :users,  :admin, :boolean, default:0
  end
end
