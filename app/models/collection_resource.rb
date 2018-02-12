# == Schema Information
#
# Table name: collection_resources
#
#  id            :integer          not null, primary key
#  collection_id :integer          not null
#  resource_id   :integer          not null
#  description   :string
#  synthesis     :boolean          default(FALSE), not null
#

class CollectionResource < ActiveRecord::Base
  belongs_to :collection
  belongs_to :resource

  scope :synthesis, -> { where(synthesis: true) }

  validates :collection, uniqueness: { scope: :resource }
end
