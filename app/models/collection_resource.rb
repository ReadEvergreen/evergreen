class CollectionResource < ActiveRecord::Base
  belongs_to :collection
  belongs_to :resource

  validates :collection, uniqueness: { scope: :resource }
end
