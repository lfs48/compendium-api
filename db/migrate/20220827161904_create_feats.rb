class CreateFeats < ActiveRecord::Migration[7.0]
  def change
    create_table :feats, id: :uuid do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.uuid :dnd_class_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
