class CreateFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :features, id: :uuid do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :type, null: false
      t.string :category, null: false

      t.timestamps
    end
  end
end
