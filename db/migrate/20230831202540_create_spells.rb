class CreateSpells < ActiveRecord::Migration[7.0]
  def change
    create_table :spells, id: :uuid do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :rank, null: false
      t.string :material
      t.boolean :concentration, default: false
      t.string :duration, null: false
      t.string :range, null: false
      t.string :targets, null: false
      t.string :casting_time, null: false
      t.string :upcast, array: true, default: []
      t.string :aspects, array: true, default: []

      t.timestamps
    end
  end
end
