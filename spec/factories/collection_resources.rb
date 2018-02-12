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

FactoryBot.define do
  factory :collection_resource do
    association :collection
    association :resource
    description { Faker::Matz.quote }
  end
end
