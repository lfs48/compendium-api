class CreateRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :races, id: :uuid do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :creature_type, null: false
      t.string :size, null: false
      
      t.timestamps
    end
  end
end
