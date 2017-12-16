# == Schema Information
#
# Table name: upvotes
#
#  id          :integer          not null, primary key
#  resource_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do

  factory :upvote do
    association :user
    association :resource
  end

end
