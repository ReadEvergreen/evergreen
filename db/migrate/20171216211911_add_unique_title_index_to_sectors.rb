class AddUniqueTitleIndexToSectors < ActiveRecord::Migration
  def change
    add_index :sectors, :title, unique: true
  end
end
