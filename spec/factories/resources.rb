# == Schema Information
#
# Table name: resources
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  url         :string           not null
#  description :string           default("")
#  media_type  :string           default("")
#  approved    :boolean          default(FALSE), not null
#  owner_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :resource, aliases: [:synthesis] do
    title         { "Resource #{NextIdFor.perform(Resource)}" }
    description   "resource_description"
    url           "http://www.google.com"
    association :owner
  end
end
