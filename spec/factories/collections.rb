# == Schema Information
#
# Table name: collections
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text             not null
#  category_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  synthesis_id :integer
#

FactoryBot.define do

  factory :collection do
    title           "collection_title"
    description     "collection_description"
    association :category
  end

end
