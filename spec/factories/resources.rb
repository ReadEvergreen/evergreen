# == Schema Information
#
# Table name: resources
#
#  id            :integer          not null, primary key
#  title         :string           not null
#  url           :string           not null
#  description   :string           default("")
#  media_type    :string           default("")
#  approved      :boolean          default(FALSE), not null
#  owner_id      :integer
#  collection_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryBot.define do

  factory :resource, aliases: [:synthesis] do
    title         "resource_title"
    description   "resource_description"
    url           "http://www.google.com"
    association :owner
    association :collection
  end

end
