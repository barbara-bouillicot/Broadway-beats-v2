class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :provider, :string, default: ""
    add_column :users, :uid, :string, default: ""
    add_column :users, :access_token, :string, default: ""
    add_column :users, :refresh_token, :string, default: ""
  end
end
