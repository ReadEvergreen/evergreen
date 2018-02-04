class AddPrimaryKeyToCollectionResources < ActiveRecord::Migration
  def change
    add_column :collection_resources, :id, :primary_key
  end
end
