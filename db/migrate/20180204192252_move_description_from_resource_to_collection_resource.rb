class MoveDescriptionFromResourceToCollectionResource < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        add_column :collection_resources, :description, :string

        CollectionResource.transaction do
          CollectionResource.all.each do |collection_resource|
            collection_resource.update_attributes!(
              description: collection_resource.resource.description
            )
          end
        end

        remove_column :resources, :description
      end

      dir.down do
        add_column :resources, :description

        CollectionResource.transaction do
          CollectionResource.all.each do |collection_resource|
            collection_resource.resource.update_attributes!(
              description: collection_resource.description
            )
          end
        end

        remove_column :collection_resources, :description
      end
    end
  end
end
