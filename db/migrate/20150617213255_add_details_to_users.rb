class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :key, :string
    add_column :users, :secret, :string
  end
end
