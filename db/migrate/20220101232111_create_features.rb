class CreateFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :features, id: :uuid do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :kind, null: false
      t.integer :level
      t.string :prereq

      t.timestamps
    end
  end
end
