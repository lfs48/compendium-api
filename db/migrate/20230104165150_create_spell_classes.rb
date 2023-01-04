class CreateSpellClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :spell_classes, id: :uuid do |t|

      t.uuid :dnd_class_id, null: false, foreign_key: true
      t.uuid :spell_id, null: false, foreign_key: true

      t.index [:dnd_class_id, :spell_id], unique: true

      t.timestamps
    end
  end
end
