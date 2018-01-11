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

RSpec.describe Resource, type: :model do

  it { should belong_to(:owner) }
  it { should have_many(:upvotes).dependent(:destroy) }
  it { should have_many(:upvoted_users).through(:upvotes) }

end
