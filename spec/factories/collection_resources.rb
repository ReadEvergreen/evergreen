# == Schema Information
#
# Table name: collection_resources
#
#  collection_id :integer          not null
#  resource_id   :integer          not null
#

FactoryBot.define do
  factory :collection_resource do
    association :collection
    association :resource
  end
end
