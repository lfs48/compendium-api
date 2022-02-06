class AddGmToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :gm, :boolean, null: false, default: false
  end
end
