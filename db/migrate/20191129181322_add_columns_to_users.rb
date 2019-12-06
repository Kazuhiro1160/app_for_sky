class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :usr_login_id, :string, null: false, default: ""
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :usr_sex, :string
    add_column :users, :usr_grade, :integer, null: false
    add_column :users, :pass_fg, :boolean, null: false, default: 1
    add_column :users, :set_fg, :boolean, null: false, default: 1
    add_column :users, :usr_class, :integer, null: false
  end
end
