class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages, id: :uuid do |t|

      t.string :body, null: false
      t.string :kind, null: false
      t.uuid :chat_id, null: false, foreign_key: true
      t.uuid :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
