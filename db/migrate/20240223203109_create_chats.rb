class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats, id: :uuid do |t|

      t.string :title, null: false
      t.timestamps
    end
  end
end
