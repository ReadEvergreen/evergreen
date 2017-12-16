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
  subject(:sector) { Sector.create(title: "business") }

  it "has a unique title" do
    duplicate_sector = sector.dup

    expect(duplicate_sector).to be_invalid
  end
end
