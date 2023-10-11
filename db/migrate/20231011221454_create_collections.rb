class CreateCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :collections, id: :uuid do |t|
      t.string :title, null: false
      t.uuid :user_id, null:false, foreign_key: true
      t.timestamps
    end

    create_table :collection_entities, id: :uuid do |t|
      t.uuid :collection_id, null: false, foreign_key: true
      t.uuid :entity_id, null: false, foreign_key: true
      t.string :entity_type, null: false
      
      t.index [:collection_id, :entity_id], unique: true
      t.timestamps
    end
  end
end
