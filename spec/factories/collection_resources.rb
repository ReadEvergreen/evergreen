FactoryBot.define do
  factory :collection_resource do
    association :collection
    association :resource
  end
end
