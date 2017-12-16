# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string
#  sector_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RSpec.describe Category, type: :model do

  it { should belong_to(:sector) }
  it { should have_many(:collections).with_foreign_key(:category_id).dependent(:nullify) }
  it { should have_many(:resources).through(:collections) }

end
