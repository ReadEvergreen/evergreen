# == Schema Information
#
# Table name: sectors
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do

  factory :sector do
    title     "sector_title"
  end

end
