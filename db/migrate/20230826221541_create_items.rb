class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items, id: :uuid do |t|

      t.string :name, null: false
      t.string :description, null: false
      t.string :kind, null: false
      t.string :rarity, null: false
      t.boolean :magic, default: false
      t.string :bulk, null: false
      t.string :value, null: false

      t.timestamps
    end
  end
end
