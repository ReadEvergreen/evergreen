# == Schema Information
#
# Table name: collection_resources
#
#  collection_id :integer          not null
#  resource_id   :integer          not null
#

class CollectionResource < ActiveRecord::Base
  belongs_to :collection
  belongs_to :resource

  validates :collection, uniqueness: { scope: :resource }
end
