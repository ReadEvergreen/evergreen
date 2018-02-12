# == Schema Information
#
# Table name: collections
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text             not null
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require_relative '../support/next_id_for'

FactoryBot.define do
  factory :collection do
    title { "Collection #{NextIdFor.perform(Collection)}" }
    description "collection_description"
    association :category
  end
end
