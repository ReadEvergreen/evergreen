# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :integer
#  last_sign_in_ip        :integer
#  user_type              :string           default("reader"), not null
#  username               :string
#

RSpec.describe User, type: :model do

  it { should have_many(:resources).with_foreign_key(:owner_id).dependent(:destroy) }

  it { should have_many(:upvotes).dependent(:destroy) }
  it { should have_many(:upvoted_resources).through(:upvotes) }

end
