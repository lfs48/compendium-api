class CreateBoons < ActiveRecord::Migration[7.0]
  def change
    create_table :boons, id: :uuid do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :prereq
      t.uuid :source_id, foreign_key: true
      t.string :source_type

      t.timestamps
    end
  end
end
