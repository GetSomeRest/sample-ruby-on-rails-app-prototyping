class CreateMods < ActiveRecord::Migration
  def change
    create_table :mods do |t|
      t.string :title
      t.boolean :latest
      t.text :urn

      t.timestamps null: false
    end
  end
end
