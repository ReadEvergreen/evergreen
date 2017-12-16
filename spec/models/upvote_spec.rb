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

RSpec.describe Upvote, type: :model do

  it { should belong_to(:user) }
  it { should belong_to(:resource) }
  it { should validate_uniqueness_of(:resource_id).scoped_to(:user_id) }

end
