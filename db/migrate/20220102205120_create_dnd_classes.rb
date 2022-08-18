class CreateDndClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :dnd_classes, id: :uuid do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :hitdie, null: false
      t.string :armor, null: false
      t.string :weapons, null: false
      t.string :tools, null: false
      t.string :saves, null: false
      t.string :skills, null: false
      t.string :equipment, array: true, default: []
      t.string :spellcasting, null: false
      t.json :table_cols, default: {}
      
      t.timestamps
    end
  end
end
