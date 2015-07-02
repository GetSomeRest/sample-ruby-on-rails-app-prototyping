class AddUidToMods < ActiveRecord::Migration
  def change
    add_column :mods, :uid, :integer
  end
end
