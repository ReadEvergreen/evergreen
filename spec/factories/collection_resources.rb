# == Schema Information
#
# Table name: collection_resources
#
#  collection_id :integer          not null
#  resource_id   :integer          not null
#  id            :integer          not null, primary key
#  description   :string
#

FactoryBot.define do
  factory :collection_resource do
    association :collection
    association :resource
    description { Faker::Matz.quote }
  end
end
