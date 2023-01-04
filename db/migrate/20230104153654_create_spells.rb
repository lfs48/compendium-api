class CreateSpells < ActiveRecord::Migration[7.0]
  def change
    create_table :spells, id: :uuid do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :rank, null: false
      t.boolean :verbal, default: true
      t.boolean :somatic, default: true
      t.boolean :material, default: true
      t.string :material_description
      t.boolean :concentration, default: false
      t.string :duration, null: false
      t.string :range, null: false
      t.string :casting_time, null: false
      t.string :higher_level

      t.timestamps
    end
  end
end
