class CreateCollectionResources < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        create_join_table :collections, :resources, table_name: :collection_resources do |t|
          t.index :collection_id
          t.index :resource_id
          t.index [:collection_id, :resource_id], unique: true
        end

        Resource.all.each do |resource|
          collection = Collection.find(resource.collection_id)

          CollectionResource.create!(
            resource: resource,
            collection: collection,
          )
        end

        remove_column :resources, :collection_id
      end

      dir.down do
        raise ActiveRecord::IrreversibleMigration
      end
    end
  end
end
