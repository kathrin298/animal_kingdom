class RenameTypeFromUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :animals, :type, :species
  end
end
