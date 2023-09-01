class AddAspectsToSpells < ActiveRecord::Migration[7.0]
  def change

    add_column :spells, :aspects, :string, array: true, default: []

  end
end
