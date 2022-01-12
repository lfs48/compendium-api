class CreateFeatureSources < ActiveRecord::Migration[7.0]
  def change
    create_table :feature_sources, id: :uuid do |t|

      t.uuid :source_id, null: false, foreign_key: true
      t.uuid :feature_id, null: false, foreign_key: true
      t.string :source_type, null: false
      t.integer :level

      t.index [:source_id, :feature_id], unique: true
      t.timestamps
    end
  end
end
