class AddJudgepToUsers < ActiveRecord::Migration
  def change
    add_column :users, :judgep, :string
  end
end
