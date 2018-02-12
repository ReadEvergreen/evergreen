class MoveSynthesisToCollectionResource < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        add_column :collection_resources, :synthesis, :boolean, null: false, default: false

        Collection.all.each do |collection|
          next if collection.synthesis_id.nil?

          collection.
            collection_resources.
            find_by(resource_id: collection.synthesis_id).
            update_attributes!(synthesis: true)
        end

        remove_column :collections, :synthesis_id, :integer
      end

      dir.down do
        add_column :collections, :synthesis_id, :integer

        CollectionResource.synthesis.each do |collection_resource|
          collection_resource.
            collection.
            update_attributes!(synthesis_id: collection_resource.resource_id)
        end

        remove_column :collection_resources, :synthesis, :boolean
      end
    end
  end
end
