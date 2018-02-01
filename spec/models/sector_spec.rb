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
  subject { create(:sector) }

  describe "#title" do
    it "must be present" do
      subject.title = nil

      expect(subject).to be_invalid
    end

    it "must be unique" do
      duplicate_sector = subject.dup

      expect(duplicate_sector).to be_invalid
    end
  end
end
