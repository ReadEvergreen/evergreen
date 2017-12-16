# == Schema Information
#
# Table name: sectors
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RSpec.describe Sector, type: :model do

  it { should have_many(:categories).with_foreign_key(:sector_id).dependent(:nullify) }
  it { should have_many(:collections).through(:categories) }
  it { should have_many(:resources).through(:collections) }
  it { should have_many(:upvotes).through(:resources) }

end
